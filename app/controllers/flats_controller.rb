class FlatsController < ApplicationController

  def index
    @flats = Flat.all

    if params[:query]
        @flats = Flat.where("city ILIKE ?", "%#{params[:query]}%")
    end

    @city = params[:city]
    @flat = Flat.where(city: @city)
     # The `geocoded` scope filters only flats with coordinates
     @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {flat: flat})
      }
     end
     # dans flat-controller action-index
      # si params[qurey] => flat.near avec params search et rayon(radius research)

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
    @markers =  [{
        lat: @flat.latitude,
        lng: @flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {flat: @flat})
      }]

      if params[:query].present?
        @flats = @flats.where(city: params[:query])
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
    params.require(:flat).permit(:title, :price, :guest, :bedroom, :description, :address, :city, :user, :photo)
  end
end
