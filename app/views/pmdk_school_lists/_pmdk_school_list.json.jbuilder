# frozen_string_literal: true

json.extract! pmdk_school_list, :id, :sekolah, :created_at, :updated_at
json.url pmdk_school_list_url(pmdk_school_list, format: :json)
