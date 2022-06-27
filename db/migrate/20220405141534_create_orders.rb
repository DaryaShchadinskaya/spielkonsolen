class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.integer :quantity, default: 1
      t.string  :phone_number
      t.string  :email
      t.string  :address
      t.string  :full_name
      t.string  :date_of_booking
      t.string  :delivery
      t.belongs_to :device, null: false

      t.timestamps
    end
  end
end
