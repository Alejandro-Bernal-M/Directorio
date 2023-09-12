class JobplacesUser < ApplicationRecord
  belongs_to :jobplace
  belongs_to :user
end