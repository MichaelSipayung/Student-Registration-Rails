# frozen_string_literal: true

json.extract! personal_gender_list, :id, :jenis_kelamin, :created_at, :updated_at
json.url personal_gender_list_url(personal_gender_list, format: :json)
