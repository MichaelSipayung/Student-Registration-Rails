class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :followed_id
    add_index :relationships, :follower_id
    # enforce uniqueness on follower_id, followed_id
    # so the user can't follow another user more than one
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
