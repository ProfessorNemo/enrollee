# frozen_string_literal: true

class Applicant < ApplicationRecord
  has_many :applicant_subjects, dependent: :destroy
  has_many :subjects, through: :applicant_subjects

  has_many :program_applicants, dependent: :destroy
  has_many :programs, through: :program_applicants

  has_many :applicant_achievements, dependent: :destroy
  has_many :achievements, through: :applicant_achievements

  validates :name_applicant, presence: true, uniqueness: true

  # Вывести абитуриентов, которые хотят поступать на образовательную программу
  # «Мехатроника и робототехника» в отсортированном по фамилиям виде.
  scope :request1, lambda {
    connection.select_all("SELECT name_applicant
                              FROM applicants
                                 JOIN program_applicants USING(applicant_id)
                                 JOIN programs USING(program_id)
                              WHERE name_program = 'Мехатроника и робототехника'
                              ORDER BY name_applicant")
  }

  # Выведите количество абитуриентов, сдавших ЕГЭ по каждому предмету, максимальное,
  # минимальное и среднее значение баллов по предмету ЕГЭ. Вычисляемые столбцы назвать
  # Количество, Максимум, Минимум, Среднее. Информацию отсортировать по названию предмета
  # в алфавитном порядке, среднее значение округлить до одного знака после запятой.
  scope :request2, lambda {
    connection.select_all("SELECT name_subject,
                             COUNT(applicant_id) AS Количество,
                             MAX(result) AS Максимум,
                             MIN(result) AS Минимум,
                             ROUND(AVG(result), 1) AS Среднее
                          FROM subjects
                               JOIN applicant_subjects USING(subject_id)
                          GROUP BY 1
                          ORDER BY 1")
  }

  # Посчитать, сколько дополнительных баллов получит каждый абитуриент.
  # Столбец с дополнительными баллами назвать Бонус. Информацию вывести
  # в отсортированном по фамилиям виде.
  scope :request3, lambda {
    connection.select_all("SELECT name_applicant,
                               NULLIF(SUM(achievements.bonus),0) AS Бонус
                        FROM applicants
                             LEFT JOIN applicant_achievements USING(applicant_id)
                             LEFT JOIN achievements USING(achievement_id)
                        GROUP BY 1
                        ORDER BY 1")
  }

  # Вывести по каждой программе абитуриента с максимальным баллом, подававшего документы на эту программу
  scope :request4, lambda {
    connection.select_all(" SELECT q1.name_program, name_applicant, best_result AS Лучший_результат
                              FROM (
                                     SELECT name_program, name_applicant, SUM(result) AS best_result
                                     FROM programs
                                         JOIN program_applicants USING(program_id)
                                         JOIN applicants USING(applicant_id)
                                         JOIN program_subjects ON program_subjects.program_id = programs.program_id
                                         JOIN applicant_subjects ON applicant_subjects.applicant_id = applicants.applicant_id AND
                                                                        applicant_subjects.subject_id = program_subjects.subject_id
                                     GROUP BY 1, 2
                                     ORDER BY 1, 3 DESC
                                   ) AS q1
                                   INNER JOIN
                                  (
                                    SELECT name_program, MAX(result_) AS max_result
                                    FROM (
                                           SELECT name_program, name_applicant, SUM(result) AS result_
                                           FROM programs
                                               JOIN program_applicants USING(program_id)
                                               JOIN applicants USING(applicant_id)
                                               JOIN program_subjects ON program_subjects.program_id = programs.program_id
                                               JOIN applicant_subjects ON applicant_subjects.applicant_id = applicants.applicant_id AND
                                                                        applicant_subjects.subject_id = program_subjects.subject_id
                                          GROUP BY 1, 2
                                          ORDER BY 1, 3 DESC
                                        ) AS q3
                                    GROUP BY 1
                                  ) AS q2
                                  ON
                                     q2.name_program = q1.name_program AND
                                     q2.max_result = q1.best_result ")
  }
end
