class HerdsController < ApplicationController
  def index
    @herds = Herd.all
  end

  def new
    @herd = Herd.new
  end

  def create
      @herd = Herd.new(herd_params)
      @herd.user = current_user
      if @herd.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    
  end

  def update
  end

  def destroy
  end
end

private 

def herd_params
  params.require(:herd).permit(:name, :description, :unit_price, :species)
end