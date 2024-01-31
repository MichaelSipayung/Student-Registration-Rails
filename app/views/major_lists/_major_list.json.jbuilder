# frozen_string_literal: true

json.extract! major_list, :id, :jurusan, :created_at, :updated_at
json.url major_list_url(major_list, format: :json)
