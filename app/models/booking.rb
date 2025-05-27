class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  scope :confirmed, -> { where(confirmed: true)}
  scope :unconfirmed, -> { where.not(confirmed: true)}
end
