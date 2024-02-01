# frozen_string_literal: true

json.extract! high_school_major, :id, :jurusan, :created_at, :updated_at
json.url high_school_major_url(high_school_major, format: :json)
