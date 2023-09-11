class Group < ApplicationRecord
  belongs_to :directors, class_name: 'Director', foreign_key: 'director_id'

  validates :name, presence: true
end