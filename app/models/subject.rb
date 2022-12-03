# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :program_subjects, dependent: :destroy
  has_many :programs, through: :program_subjects

  has_many :applicant_subjects, dependent: :destroy
  has_many :applicants, through: :applicant_subjects

  validates :name_subject, presence: true, uniqueness: true
end
