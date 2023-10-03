class AddPriceToPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :price, :integer
  end
end
