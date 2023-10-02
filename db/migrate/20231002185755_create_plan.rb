class CreatePlan < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :number_of_groups
      t.integer :number_of_users_per_group
      
      t.timestamps
    end
  end
end
