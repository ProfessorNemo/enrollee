# frozen_string_literal: true

class Achievement < ApplicationRecord
  has_many :applicant_achievements, dependent: :destroy
  has_many :applicants, through: :applicant_achievements

  validates :name_achievement, presence: true, uniqueness: true
end
