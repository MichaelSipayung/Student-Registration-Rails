# frozen_string_literal: true

json.extract! achievement_tingkat_list, :id, :tingkat, :created_at, :updated_at
json.url achievement_tingkat_list_url(achievement_tingkat_list, format: :json)
