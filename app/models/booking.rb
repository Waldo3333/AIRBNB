class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :guest, :entry_date, :out_date, presence: true
end
