# frozen_string_literal: true

class Program < ApplicationRecord
  belongs_to :department

  has_many :program_subjects, dependent: :destroy
  has_many :subjects, through: :program_subjects

  has_many :program_applicants, dependent: :destroy
  has_many :applicants, through: :program_applicants

  validates :name_program, presence: true, uniqueness: true

  # Вывести образовательные программы,на которые для поступления необходим предмет «Информатика».
  # Программы отсортировать в обратном алфавитном порядке.
  scope :request1, lambda {
    connection.select_all("SELECT name_program
                                FROM programs
                                  JOIN program_subjects USING(program_id)
                                  JOIN subjects USING(subject_id)
                                WHERE name_subject = 'Информатика'
                                ORDER BY name_program DESC")
  }

  # Вывести образовательные программы, для которых минимальный балл ЕГЭ по каждому предмету
  # больше или равен 40 баллам. Программы вывести в отсортированном по алфавиту виде.
  scope :request2, lambda {
    connection.select_all("SELECT name_program
                              FROM (
                                  SELECT name_program, MIN(min_result)
                                  FROM programs
                                      NATURAL JOIN program_subjects
                                  GROUP BY 1
                                  HAVING MIN(min_result) >= 40) table1
                              ORDER BY 1")
  }

  # Вывести образовательные программы, которые имеют самый большой план набора,
  # вместе с этой величиной.
  scope :request3, lambda {
    connection.select_all("SELECT name_program, plan
                              FROM programs
                              WHERE plan = (SELECT MAX(plan) FROM programs)")
  }

  # Вывести образовательные программы, на которые для поступления необходимы предмет
  # «Информатика» и «Математика» в отсортированном по названию программ виде.
  scope :request4, lambda {
    connection.select_all("SELECT name_program
                            FROM programs
                                JOIN program_subjects ps USING(program_id)
                                JOIN subjects s ON ps.subject_id = s.subject_id AND
                                     name_subject IN ('Информатика','Математика')
                            GROUP BY 1
                            HAVING COUNT(name_subject) = 2
                            ORDER BY 1")
  }

  # Посчитать количество баллов каждого абитуриента на каждую образовательную программу,
  # на которую он подал заявление, по результатам ЕГЭ. В результат включить название
  # образовательной программы, фамилию и имя абитуриента, а также столбец с суммой баллов,
  # который назвать Итог. Информацию вывести в отсортированном сначала по образовательной
  # программе, а потом по убыванию суммы баллов виде.
  scope :request5, lambda {
    connection.select_all("SELECT name_program, name_applicant, SUM(applicant_subjects.result) AS Итог
                                FROM applicants
                                  JOIN program_applicants USING(applicant_id)
                                  JOIN programs USING(program_id)
                                  JOIN program_subjects USING(program_id)
                                  JOIN subjects USING(subject_id)
                                  JOIN applicant_subjects ON subjects.subject_id = applicant_subjects.subject_id
                                AND applicant_subjects.applicant_id = applicants.applicant_id
                                GROUP BY name_applicant, name_program
                                ORDER BY name_program ASC, Итог DESC")
  }

  # Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали
  # документы на эту образовательную программу, но не могут быть зачислены на нее.
  # Эти абитуриенты имеют результат по одному или нескольким предметам ЕГЭ, необходимым для
  # поступления на эту образовательную программу, меньше минимального балла. Информацию вывести
  # в отсортированном сначала по программам, а потом по фамилиям абитуриентов виде.
  scope :request6, lambda {
    connection.select_all("SELECT name_program, name_applicant
                              FROM applicants
                              JOIN program_applicants USING (applicant_id)
                              JOIN programs USING (program_id)
                              JOIN program_subjects USING (program_id)
                              JOIN applicant_subjects USING (subject_id, applicant_id)
                              WHERE result < min_result
                              GROUP BY 1, 2
                              ORDER BY 1, 2")
  }
end
