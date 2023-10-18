class Plan < ApplicationRecord
  has_many :directors_plans
  has_many :directors, through: :directors_plans
  has_many :orders

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

  def assign
    @plan= self
    @director = current_director
    ActiveRecord::Base.connection.execute("DELETE FROM directors_plans WHERE plan_id = #{@directorplan.plan_id} AND director_id = #{@director.id}")
    DirectorsPlan.create(plan: @plan, director: @director)
    redirect_to director_path(current_director), notice: "Plan actualizado"
    @director.update(next_payment: 1.year.from_now);
   
  end
  
end