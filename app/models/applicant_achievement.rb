# frozen_string_literal: true

class ApplicantAchievement < ApplicationRecord
  belongs_to :applicant
  belongs_to :achievement
end
