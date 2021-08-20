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
      redirect_to herd_bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    herd_id = @booking.herd_id
    if @booking.save
      redirect_to herd_bookings_path(herd_id)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to herds_path
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :amount, :user_id, :herd_id)
  end

  def set_herd
    @herd = Herd.find(params[:herd_id])
  end
end
