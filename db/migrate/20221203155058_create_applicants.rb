# frozen_string_literal: true

class CreateApplicants < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS applicants CASCADE;

      CREATE TABLE IF NOT EXISTS applicants (
          applicant_id serial PRIMARY KEY,
          name_applicant VARCHAR(50),
          CONSTRAINT uniq_applicant UNIQUE (name_applicant)
      );
    SQL
  end

  def self.down
    execute 'DROP TABLE applicants'
  end
end
