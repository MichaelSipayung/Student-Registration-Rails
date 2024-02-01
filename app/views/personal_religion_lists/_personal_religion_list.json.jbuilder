# frozen_string_literal: true

json.extract! personal_religion_list, :id, :agama, :created_at, :updated_at
json.url personal_religion_list_url(personal_religion_list, format: :json)
