class Job < ApplicationRecord
  belongs_to :users

  validates :name, presence: true
end