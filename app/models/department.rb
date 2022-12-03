# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :programs, dependent: :destroy
  validates :name_department, presence: true, uniqueness: true

  # Выведите сколько человек подало заявление на каждую образовательную программу и конкурс
  # на нее (число поданных заявлений деленное на количество мест по плану), округленный до 2-х
  # знаков после запятой. В запросе вывести название факультета, к которому относится
  # образовательная программа, название образовательной программы, план набора абитуриентов
  # на образовательную программу (plan), количество поданных заявлений (Количество) и Конкурс.
  # Информацию отсортировать в порядке убывания конкурса.
  scope :request1, lambda {
    connection.select_all("SELECT name_department, name_program, plan,
                              COUNT(*) AS Количество,
                              ROUND(COUNT(*)/plan ,2) AS Конкурс
                            FROM program_applicants
                              JOIN programs USING (program_id)
                              JOIN departments USING (department_id)
                            GROUP BY name_department, name_program, plan
                            ORDER BY plan, name_program DESC")
  }
end
