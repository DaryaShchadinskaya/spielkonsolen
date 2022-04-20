class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :description
      t.string :equipment
      t.decimal :price
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
