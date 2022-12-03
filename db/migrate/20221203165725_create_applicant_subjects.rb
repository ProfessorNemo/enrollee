# frozen_string_literal: true

class CreateApplicantSubjects < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS applicant_subjects CASCADE;

      CREATE TABLE IF NOT EXISTS applicant_subjects (
          applicant_subject_id serial PRIMARY KEY,
          applicant_id INT,
          subject_id INT,
          result INT,
          FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id) ON DELETE CASCADE,
          FOREIGN KEY (subject_id) REFERENCES subjects (subject_id) ON DELETE CASCADE
          );
    SQL
  end

  def self.down
    execute 'DROP TABLE applicant_subjects'
  end
end
