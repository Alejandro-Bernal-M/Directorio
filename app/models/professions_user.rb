class ProfessionsUser < ApplicationRecord
  belongs_to :profession
  belongs_to :user
end