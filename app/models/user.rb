class User < ApplicationRecord
  has_many :jobs
  has_many :professions
  has_many :jobplaces

  belongs_to :groups

  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
end