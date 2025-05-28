class DashboardsController < ApplicationController

  def index
    @user_bookings = current_user.bookings ## apart ou je vais dormir

    @flats = current_user.flats
    @my_flats_bookings_ids = [] ## mes bien booké par dautres users
    @flats.each do |flat|
      @my_flats_bookings_ids << Booking.where(flat: flat).ids
    end


    @my_flats_bookings = Booking.where(id: @my_flats_bookings_ids)


    @my_flats_bookings_confirmed = @my_flats_bookings.confirmed
    @my_flats_bookings_unconfirmed = @my_flats_bookings.unconfirmed
  end

end
