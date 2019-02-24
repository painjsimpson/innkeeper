class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :icon
      t.string :label
      t.string :target
      t.string :action
      t.integer :order

      t.timestamps
    end
  end
end
