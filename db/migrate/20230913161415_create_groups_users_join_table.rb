class CreateGroupsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    def change
      create_table :groups_users do |t|
        t.references :group, foreign_key: true
        t.references :user, foreign_key: true
      end
    end
  end
end
