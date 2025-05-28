class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user


  scope :confirmed, -> { where(confirmed: true)}
  scope :unconfirmed, -> { where.not(confirmed: true)}

  # scope :mybooking -> {where.user_id = current_user}


  validates :guest, :entry_date, :out_date, presence: true

end
