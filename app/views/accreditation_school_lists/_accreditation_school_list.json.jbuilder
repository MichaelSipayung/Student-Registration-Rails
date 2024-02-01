# frozen_string_literal: true

json.extract! accreditation_school_list, :id, :akreditasi, :created_at, :updated_at
json.url accreditation_school_list_url(accreditation_school_list, format: :json)
