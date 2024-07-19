# frozen_string_literal: true

class UserCoursesController < ApplicationController
  def index
    @user_courses = UserCourse.all
  end

  def like
    user_course = UserCourse.find(params[:id]).increment!(:likes)
    # redirect_to user_courses_path
    render user_course
  end
end
