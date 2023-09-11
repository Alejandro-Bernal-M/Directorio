class Jobplace < ApplicationRecord
  belongs_to :users

  validates :name, presence: true
  validates :city, presence: true
end