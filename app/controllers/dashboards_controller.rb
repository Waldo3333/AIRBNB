class DashboardsController < ApplicationController
  def index
    @bookings = current_user.bookings
    # @mybooking = @booking.mybooking
    @bookings_confirmed = @bookings.confirmed
    @bookings_unconfirmed = @bookings.unconfirmed
    @flats = current_user.flats
  end

end
