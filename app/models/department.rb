# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :programs, dependent: :destroy
  validates :name_department, presence: true, uniqueness: true
end
