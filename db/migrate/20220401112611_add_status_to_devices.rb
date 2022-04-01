class AddStatusToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :status, :string, null: false, default: 'actual'
  end
end
