# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:user_courses) }
    it { should have_many(:courses).through(:user_courses) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'instance methods' do
    it '#name_and_email' do
      user = User.create(email: 'jhon@doe', name: 'Jhon Doe')
      expect(user.name_and_email).to eq('Jhon Doe - jhon@doe')
    end
  end

  # second method
  # it 'has_many :user_courses' do
  #   expect(User.reflect_on_association(:user_courses)).to_not be_nil
  # end

  # it 'has_many :courses, through: :user_courses' do
  #   expect(User.reflect_on_association(:courses)).to_not be_nil
  # end

  # first method
  # it 'has_many :user_courses' do
  #   user = User.create(email: 'test@test.com', name: 'Batman')
  #   course = Course.create(title: 'Batman Course', video_url: 'http://batman.com')
  #   user_course = UserCourse.create(user_id: user.id, course_id: course.id)

  #   expect(user.user_courses).to include(user_course)
  # end

  # it 'has_many :courses, through: :user_courses' do
  #   user = User.create(email: 'test@test.com', name: 'Batman')
  #   course = Course.create(title: 'Batman Course', video_url: 'http://batman.com')
  #   UserCourse.create(user_id: user.id, course_id: course.id)

  #   expect(user.courses).to include(course)
  # end
end
