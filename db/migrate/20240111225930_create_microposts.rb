# frozen_string_literal: true

class CreateMicroposts < ActiveRecord::Migration[7.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    # since we expect to retrieve all the micropost associated with a given
    # user id in reverse order of creation, we need add index to both user_id and created_at
    add_index :microposts, %i[user_id created_at]
  end
end
