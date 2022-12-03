# frozen_string_literal: true

class ApplicantSubject < ApplicationRecord
  belongs_to :applicant
  belongs_to :subject
end
