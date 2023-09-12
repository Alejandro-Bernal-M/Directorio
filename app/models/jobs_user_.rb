class JobsUser < ApplicationRecord
  has_many :responsibilities, dependent: :destroy

  belongs_to :job
  belongs_to :user
end