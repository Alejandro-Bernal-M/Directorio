class Group < ApplicationRecord
  belongs_to :directors, class_name: 'Director', foreign_key: 'director_id'

  has_and_belongs_to_many :users

  has_many :requests
  validates :name, presence: true
end