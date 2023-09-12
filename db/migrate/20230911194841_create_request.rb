class CreateRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
