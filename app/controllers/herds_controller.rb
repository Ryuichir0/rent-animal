class HerdsController < ApplicationController
  before_action :authenticate_user!

<<<<<<< HEAD
    def index
      # @herds = Herd.where(user_id: current_user)
      if params[:query]
        @herds = Herd.search_by_name_and_address(params[:query])
      else
        @herds = Herd.all
      end
      @markers = @herds.geocoded.map do |herd|
        {
          lat: herd.latitude,
          lng: herd.longitude,
          info_window: render_to_string(partial: "info_windows", locals: { herd: herd })
        }
      end
=======
    if params[:query] && params[:query] != ""
      @herds = Herd.search_by_name_and_address(params[:query])
    else
      @herds = Herd.all
    end
    @markers = @herds.geocoded.map do |herd|
      {
        lat: herd.latitude,
        lng: herd.longitude,
        info_window: render_to_string(partial: "info_windows", locals: { herd: herd })
      }
>>>>>>> 8b87a6291b1494a7b0a7e66382c4af1651f31ed7
    end

  def show
    @herd = Herd.find(params[:id])
  end

  def new
    @herd = Herd.new
  end

  def create
    @herd = Herd.new(herd_params)
    @herd.user = current_user
    if @herd.save
      redirect_to herds_path
    else
      render :new
    end
  end

  def edit
    @herd = Herd.find(params[:id])
  end

  def update
    @herd = Herd.find(params[:id])
    @herd.update(herd_params)

    redirect_to herd_path(@herd)
  end

  def destroy
    @herd = Herd.find(params[:id])
    @herd.destroy

    redirect_to herds_path
  end
end

private

def herd_params
  params.require(:herd).permit(:name, :description, :address, :unit_price, :species, :photo)
end
