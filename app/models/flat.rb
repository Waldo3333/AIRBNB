class Flat < ApplicationRecord

  belongs_to :user

  # Hello
  geocoded_by :full_address

  after_validation :geocode, if: :will_save_change_to_address?
  validates :title, :price, :guest, :bedroom, :description, :address, :city,  presence: true

  def full_address
    [address, city].compact.join(', ')
  end

  has_one_attached :photo
  validates :title, :price, :guest, :bedroom, :description, :address, presence: true


end
