# frozen_string_literal: true

class CreateProgramSubjects < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS program_subjects CASCADE;

      CREATE TABLE IF NOT EXISTS program_subjects (
          program_subject_id serial PRIMARY KEY,
          program_id INT,
          subject_id INT,
          min_result INT,
          FOREIGN KEY (program_id) REFERENCES programs (program_id)  ON DELETE CASCADE,
          FOREIGN KEY (subject_id) REFERENCES subjects (subject_id) ON DELETE CASCADE
          );
    SQL
  end

  def self.down
    execute 'DROP TABLE program_subjects'
  end
end
