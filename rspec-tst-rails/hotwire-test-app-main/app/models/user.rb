# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  validates :name, presence: true

  def name_and_email
    "#{name} - #{email}"
  end
end
