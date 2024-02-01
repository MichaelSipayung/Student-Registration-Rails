# frozen_string_literal: true

json.extract! source_information_list, :id, :informasi, :created_at, :updated_at
json.url source_information_list_url(source_information_list, format: :json)
