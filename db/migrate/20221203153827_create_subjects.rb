# frozen_string_literal: true

class CreateSubjects < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS subjects CASCADE;

      CREATE TABLE IF NOT EXISTS subjects (
          subject_id serial PRIMARY KEY,
          name_subject VARCHAR(30),
          CONSTRAINT uniq_subject UNIQUE (name_subject)
      );
    SQL
  end

  def self.down
    execute 'DROP TABLE subjects'
  end
end
