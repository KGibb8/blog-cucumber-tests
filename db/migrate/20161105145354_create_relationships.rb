class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    # Since we will be finding relationships using follower_id/followed_id, adding an index on each column increases efficiency
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # Enforces uniqueness on pairs, a user cannot follow another more than once
    # Raises error if a user tries to create duplicate relationships
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
