class AddColorToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :color, :string
  end
end
