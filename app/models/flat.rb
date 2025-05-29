class Flat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :title, :price, :guest, :bedroom, :description, :address, presence: true

end
