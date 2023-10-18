class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :paid, :default => false
      t.string :token
      t.integer :price
      
      t.timestamps
    end
  end
end
