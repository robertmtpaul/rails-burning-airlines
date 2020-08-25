class FlightsController < ApplicationController
  def new
    @flight = Flight.new
    @airports = Airport.all.map{|a| [a.name, a.code]}
    @airplanes = Airplane.all.map{|a| [a.name, a.id]}
  end

  def create
    @flight = Flight.create flight_params
    redirect_to flights_path
  end

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find params[:id]
    @airplane = Airplane.find @flight.airplane_id
    @origin = Airport.find_by(code: @flight.origin)
    @destination = Airport.find_by(code: @flight.destination)
  end

  def edit
    @flight = Flight.find params[:id]
    @airports = Airport.all.map{|a| [a.name, a.code]}
    @airplanes = Airplane.all.map{|a| [a.name, a.id]}
  end

  def update
    flight = Flight.find params[:id]
    flight.update flight_params
    redirect_to flights_path
  end

  def destroy
    flight = Flight.find params[:id]
    flight.destroy
    redirect_to flights_path
  end


  private

  def flight_params
    params.require(:flight).permit(:flight_number, :origin, :destination, :date, :airplane_id)
  end
end
