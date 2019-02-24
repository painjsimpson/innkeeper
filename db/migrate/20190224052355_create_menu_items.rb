class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.references :menu, foreign_key: true
      t.string :icon
      t.string :label
      t.string :target
      t.string :action
      t.integer :order

      t.timestamps
    end
  end
end
