class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :jobs
  has_and_belongs_to_many :professions
  has_and_belongs_to_many  :jobplaces

  has_one_attached :image

  has_and_belongs_to_many :groups, class_name: 'Group'

  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
end