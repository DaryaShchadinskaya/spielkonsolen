class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total   
      t.integer :quantity
      t.belongs_to :device, null: false

      t.timestamps
    end
  end
end
