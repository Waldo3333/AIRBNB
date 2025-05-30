class DashboardsController < ApplicationController

  def index
    @user_bookings = current_user.bookings ## apart ou je vais dormir
    @flats = current_user.flats
    @user_bookings_confirmed = @user_bookings.where(confirmed: true)
    @user_bookings_unconfirmed = @user_bookings.where(confirmed: false)
    @my_flats_bookings_ids = [] ## mes bien booké par dautres users
    @flats.each do |flat|
      @my_flats_bookings_ids << Booking.where(flat: flat).ids
    end

    @my_flats_bookings = Booking.where(id: @my_flats_bookings_ids.flatten)
      # @my_flats_bookings = Booking.joins(:flat).where(flats: { user_id: current_user.id }) ## mes bien booké par dautres users



    @my_flats_bookings_confirmed = @my_flats_bookings.confirmed
    @my_flats_bookings_unconfirmed = @my_flats_bookings.unconfirmed
  end

end
