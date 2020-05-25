class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.integer :area, default: 0, null: false
      t.string :img
      t.text :review
      t.integer :genre, default: 0, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
