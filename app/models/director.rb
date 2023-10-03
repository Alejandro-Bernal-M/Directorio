class Director < ApplicationRecord
  has_secure_password
  has_many :groups, dependent: :destroy
  has_one :directors_plan
  has_one :plan, through: :directors_plan, source: :plan

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

end