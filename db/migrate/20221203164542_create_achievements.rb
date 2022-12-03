# frozen_string_literal: true

class CreateAchievements < ActiveRecord::Migration[6.1]
  def self.up
    execute <<~SQL.squish
      DROP TABLE IF EXISTS achievements CASCADE;

      CREATE TABLE IF NOT EXISTS achievements (
          achievement_id serial PRIMARY KEY,
          name_achievement VARCHAR(30),
          bonus INT,
          CONSTRAINT uniq_achievement UNIQUE (name_achievement)
      );
    SQL
  end

  def self.down
    execute 'DROP TABLE achievements'
  end
end
