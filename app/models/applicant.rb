# frozen_string_literal: true

class Applicant < ApplicationRecord
  has_many :applicant_subjects, dependent: :destroy
  has_many :subjects, through: :applicant_subjects

  has_many :program_applicants, dependent: :destroy
  has_many :programs, through: :program_applicants

  has_many :applicant_achievements, dependent: :destroy
  has_many :achievements, through: :applicant_achievements

  validates :name_applicant, presence: true, uniqueness: true
end
