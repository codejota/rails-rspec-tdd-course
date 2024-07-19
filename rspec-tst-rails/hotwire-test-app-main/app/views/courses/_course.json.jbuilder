# frozen_string_literal: true

json.extract! course, :id, :title, :video_url, :created_at, :updated_at
json.url course_url(course, format: :json)
