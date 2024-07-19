# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :video_url
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
