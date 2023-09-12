class CreateTable < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
