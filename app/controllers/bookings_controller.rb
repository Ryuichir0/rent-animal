class BookingsController < ApplicationController
  before_action :set_herd, only: [:index, :show, :new, :create]
  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.herd = @herd
    @booking.user = current_user
    if @booking.save
      redirect_to herds_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to herd_bookings_path(@herd)
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :amount, :user_id, :herd_id)
  end

  def set_herd
    @herd = Herd.find(1)
  end
end
