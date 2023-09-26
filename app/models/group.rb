class Group < ApplicationRecord
  belongs_to :director, class_name: 'Director', foreign_key: 'director_id'

  has_and_belongs_to_many :users

  has_many :requests, dependent: :destroy
  validates :name, presence: { message: "El grupo debe tener nombre" }
  validates :color, presence: { message: "El grupo debe tener color" }
  validates :slogan, presence: { message: "El grupo debe tener slogan" }
end