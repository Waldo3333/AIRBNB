# class Flat < ApplicationRecord

#   belongs_to :user
#   has_many :bookings, dependent: :destroy

#   # Hello
#   geocoded_by :full_address

#   after_validation :geocode, if: :will_save_change_to_address?
#   validates :title, :price, :guest, :bedroom, :description, :address, :city,  presence: true

#   def full_address
#     [address, city].compact.join(', ')
#   end

#   has_one_attached :photo

# end

class Flat < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy

  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode_to_city_level, if: [:will_save_change_to_address?, :will_save_change_to_city?]
  after_validation :reverse_geocode, if: [:will_save_change_to_address?, :will_save_change_to_city?]
  validates :title, :price, :guest, :bedroom, :description, :address,  presence: true


  has_one_attached :photo

  private

  def geocode_to_city_level
    full_address_result = Geocoder.search(address)
    if full_address_result.any?
      full_result = full_address_result.first

      city_name = full_result.city || result.data['place_name']&.split(',')&.first
      if city_name.present?
        city_result = Geocoder.search(city_name)
        if city_result.any?
          city_result = city_result.first
          self.latitude = city_result.latitude
          self.longitude = city_result.longitude
        end
      end
    end
  end
end
