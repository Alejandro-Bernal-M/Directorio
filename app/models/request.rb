class Request < ApplicationRecord
  validates :group_id, uniqueness: { scope: :user_id, message: 'La solicitud ya existe' }
  belongs_to :group
end