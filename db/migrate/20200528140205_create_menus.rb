class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :price
      t.string :img
      t.string :menu
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
