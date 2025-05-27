  class BookingsController < ApplicationController

    def show
    end

    def new
      @booking = Booking.new()
    end

    def create
      @flat = Flat.find(params[:flat_id])
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.flat = @flat # ca ca va bouger aussi

      if @booking.save
        redirect_to flat_path(@flat)
      else
        render "flats/show", flat: @flat ,status: :unprocessable_entity
      end
    end

    def update
      @booking = Booking.find(params[:id])
      @booking.update(booking_params)
      redirect_to bookings_path
    end

    def delete
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to bookings_path, status: :see_other
    end

    private

    def booking_params
      params.require(:booking).permit(:entry_date, :out_date, :guest)
    end

  end
