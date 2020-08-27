class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    reservation = Reservation.where(flight_number: params[:flight_number], seat_number: params[:seat_number]).first
    reservation.update(user_id: params[:user_id])
  end

  def destroy
  end
end
