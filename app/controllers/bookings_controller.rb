class BookingsController < ApplicationController
  before_action :set_booking, except: [:index]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
