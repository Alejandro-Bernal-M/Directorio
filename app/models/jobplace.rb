class Jobplace < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :city, presence: 
  
  def name_and_city
    "#{name} de #{city}"
  end

end