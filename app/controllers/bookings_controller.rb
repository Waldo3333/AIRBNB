  class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
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
        redirect_to dashboards_path
      else
        @bookingatflat = Booking.where(flat: @flat, confirmed: true)
        @tableaudate = @bookingatflat.map do |book|
          {
            from: book.entry_date,
            to: book.out_date
          }
        end
        render "flats/show", locals: {tableaudate: @tableaudate, flat:@flat, booking:@booking} ,status: :unprocessable_entity
      end
    end

    def update
      @booking = Booking.find(params[:id])
      @booking.update(booking_params)
      redirect_to dashboards_path
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to flat_bookings_path, status: :see_other
    end

  def edit
    @booking = Booking.find(params[:id])
  end


    private

    def booking_params
      params.require(:booking).permit(:entry_date, :out_date, :guest, :confirmed)
    end

  end
