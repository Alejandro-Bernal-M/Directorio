class CreateResponsabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :responsibilities do |t|
      t.string :description
      t.integer :jobs_user_id
      t.timestamps
    end
  end
end
