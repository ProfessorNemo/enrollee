# frozen_string_literal: true

class ProgramApplicant < ApplicationRecord
  belongs_to :program
  belongs_to :applicant
end
