class CreateDirectorsPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :directors_plans, id: false do |t|
      t.belongs_to :director
      t.belongs_to :plan
    end

    add_index :directors_plans, [:director_id, :plan_id], unique: true
  end
end
