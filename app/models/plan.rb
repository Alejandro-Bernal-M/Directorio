class Plan < ApplicationRecord
  has_many :directors_plans
  has_many :directors, through: :directors_plans
end