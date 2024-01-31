# frozen_string_literal: true

json.extract! batch_list, :id, :gelombang, :aktif, :created_at, :updated_at
json.url batch_list_url(batch_list, format: :json)
