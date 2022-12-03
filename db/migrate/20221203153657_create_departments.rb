# frozen_string_literal: true

class CreateDepartments < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS departments CASCADE;

      CREATE TABLE IF NOT EXISTS departments (
          department_id serial PRIMARY KEY,
          name_department VARCHAR(30),
          CONSTRAINT uniq_department UNIQUE (name_department)
      );
    SQL
  end

  def self.down
    execute 'DROP TABLE departments'
  end
end
