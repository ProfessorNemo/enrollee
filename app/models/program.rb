# frozen_string_literal: true

class Program < ApplicationRecord
  belongs_to :department

  has_many :program_subjects, dependent: :destroy
  has_many :subjects, through: :program_subjects

  has_many :program_applicants, dependent: :destroy
  has_many :applicants, through: :program_applicants

  validates :name_program, presence: true, uniqueness: true
end
