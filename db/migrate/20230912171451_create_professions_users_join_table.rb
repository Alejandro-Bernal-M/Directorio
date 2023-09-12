class CreateProfessionsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :professions_users do |t|
      t.references :profession, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
