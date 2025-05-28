class Flat < ApplicationRecord
  belongs_to :user
  # Hello

  # scope :myflatbooked -> {where.user_id = current_user}
  
  validates :title, :price, :guest, :bedroom, :description, :address, presence: true
end
