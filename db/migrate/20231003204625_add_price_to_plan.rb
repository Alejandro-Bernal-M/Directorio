class AddPriceToPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :price, :integer
    add_foreign_key :directors_plans, :plans, on_delete: :cascade

  end
end
