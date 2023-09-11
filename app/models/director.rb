class Director < ApplicationRecord
  has_secure_password
  has_many :groups

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

end