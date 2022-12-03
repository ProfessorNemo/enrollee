# frozen_string_literal: true

class ProgramSubject < ApplicationRecord
  belongs_to :program
  belongs_to :subject
end
