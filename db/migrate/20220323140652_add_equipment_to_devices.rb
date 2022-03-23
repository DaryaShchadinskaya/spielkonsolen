class AddEquipmentToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :equipment, :string
  end
end
