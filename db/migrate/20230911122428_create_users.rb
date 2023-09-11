class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.integer :profession_id
      t.integer :job_id
      t.integer :jobplace_id
      
      t.timestamps
    end
  end
end
