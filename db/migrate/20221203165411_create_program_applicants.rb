# frozen_string_literal: true

class CreateProgramApplicants < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS program_applicants CASCADE;

      CREATE TABLE IF NOT EXISTS program_applicants (
          program_applicant_id serial PRIMARY KEY,
          program_id INT,
          applicant_id INT,
          FOREIGN KEY (program_id) REFERENCES programs (program_id) ON DELETE CASCADE,
          FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id) ON DELETE CASCADE
          );
    SQL
  end

  def self.down
    execute 'DROP TABLE program_applicants'
  end
end
