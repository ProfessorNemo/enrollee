# frozen_string_literal: true

class CreateApplicantAchievements < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS applicant_achievements CASCADE;

      CREATE TABLE IF NOT EXISTS applicant_achievements (
          applicant_achievement_id serial PRIMARY KEY,
          applicant_id INT,
          achievement_id INT,
          FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id) ON DELETE CASCADE,
          FOREIGN KEY (achievement_id) REFERENCES achievements (achievement_id) ON DELETE CASCADE
          );
    SQL
  end

  def self.down
    execute 'DROP TABLE applicant_achievements'
  end
end
