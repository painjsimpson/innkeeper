class AddValueToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :value, :string
  end
end
