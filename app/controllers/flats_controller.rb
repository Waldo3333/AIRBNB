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

  def destroy
  end

  private


  def flat_params
    params.require(:flat).permit(:title,:price, :guest, :bedroom, :description, :address, :city, :user)
  end
end
