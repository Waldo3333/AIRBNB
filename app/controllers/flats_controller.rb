class FlatsController < ApplicationController

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
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
    @flat.user = current_user
    @flat.destroy
    redirect_to flat_path, status: :see_other
  end


  private


  def flat_params
    params.require(:flat).permit(:title, :price, :guest, :bedroom, :description, :address, :city, :user)
  end
end
