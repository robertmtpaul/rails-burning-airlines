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

    old_reservations = Reservation.where(flight_id: params[:id])
    old_reservations.destroy_all

    new_reservations = params[:reservations]
    new_reservations each do |reser|
      Reservation.create(flight_id: reser.flight_id, seat_number: reser.seat_number, user_id: reser.user_id)
    end


  end

  def destroy
  end
end
