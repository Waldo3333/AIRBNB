class BookingsController < ApplicationController

  def show
  end

  def new
    @booking = Booking.new()
  end

  def create
    @flat = Flat.last # a terme il sera choisi automatiquement
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat # ca ca va bouger aussi

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end


  end



  private

  def booking_params
     params.require(:booking).permit(:entry_date, :out_date, :guest)
  end

end
