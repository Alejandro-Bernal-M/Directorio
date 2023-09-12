class CreateJobplacesUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :jobplaces_users do |t|
      t.references :jobplace, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
