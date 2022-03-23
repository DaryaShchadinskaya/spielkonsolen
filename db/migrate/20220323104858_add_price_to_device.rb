class AddPriceToDevice < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :price, :decimal
  end
end
