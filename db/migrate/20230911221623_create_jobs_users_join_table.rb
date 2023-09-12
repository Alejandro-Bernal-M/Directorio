class CreateJobsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs_users do |t|
      t.references :job, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
