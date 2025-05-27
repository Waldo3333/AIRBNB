class Flat < ApplicationRecord
  belongs_to :user
  # Hello
  validates :title, :price, :guest, :bedroom, :description, :address, presence: true
end
