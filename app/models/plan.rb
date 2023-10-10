class Plan < ApplicationRecord
  has_many :directors_plans
  has_many :directors, through: :directors_plans

  validates :name, presence: true
  validates :number_of_groups, presence: true
  validates :number_of_users_per_group, presence: true

  def to_paypal
    {
      name: self.name,
      sku: self.id,
      price: self.price,
      currency: 'COP',
      quantity: 1
    }
  end

end