# frozen_string_literal: true

class RemoveWhatsappFromPersonal < ActiveRecord::Migration[7.1]
  def change
    remove_column :personals, :whatsapp, :string
  end
end
