class AddStatusToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :status, :integer, default: 0
  end
end
