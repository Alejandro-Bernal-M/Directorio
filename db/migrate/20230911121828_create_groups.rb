class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :director_id
      t.timestamps
    end

    add_foreign_key :groups, :directors, column: :director_id
  end
end
