class Director < ApplicationRecord
  has_secure_password
  has_many :groups, dependent: :destroy
  has_one :plan

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

end