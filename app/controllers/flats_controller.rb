class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

   def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @bookingatflat = Booking.where(flat: @flat, confirmed: true)
    @tableaudate = @bookingatflat.map do |book|
      {
        from: book.entry_date,
        to: book.out_date
      }
    end
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to dashboards_path()
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
     @flat = Flat.find(params[:id])
     @flat.user = current_user
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path(@flats), status: :see_other
  end


  private


  def flat_params
    params.require(:flat).permit(:title, :price, :guest, :bedroom, :description, :address, :city, :user)
  end
end
