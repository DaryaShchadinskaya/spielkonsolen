class AddStatusToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :status, :string, default: 'actual'
  end
end
