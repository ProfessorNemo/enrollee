# frozen_string_literal: true

class CreatePrograms < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS programs CASCADE;

      CREATE TABLE IF NOT EXISTS programs (
          program_id serial PRIMARY KEY,
          name_program TEXT,
          department_id INT,
          plan INT,
          CONSTRAINT uniq_program UNIQUE (name_program),
          FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE
      );
    SQL
  end

  def self.down
    execute 'DROP TABLE programs'
  end
end
