class Responsibility < ApplicationRecord
  belongs_to :jobs_user, class_name: 'JobsUser', foreign_key: 'jobs_user_id'
end