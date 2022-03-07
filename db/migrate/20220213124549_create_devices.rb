class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :description
      t.string :complectation
      t.float  :price
      t.timestamps
    end
  end
end
