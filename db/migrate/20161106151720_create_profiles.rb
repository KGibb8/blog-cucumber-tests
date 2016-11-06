class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.text :description
      t.json :photos
      t.string :avatar
      t.string :theme_color
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
