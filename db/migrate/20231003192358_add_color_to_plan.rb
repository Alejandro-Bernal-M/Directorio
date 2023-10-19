class AddColorToPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :color, :string
  end
end
