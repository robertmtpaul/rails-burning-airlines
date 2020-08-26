class FlightsController < ApplicationController
  def new
    @flight = Flight.new
    @airports = Airport.all.map{|a| [a.name, a.code]}
    @airplanes = Airplane.all.map{|a| [a.name, a.id]}
  end

  def create
    @flight = Flight.create flight_params
    # find the airplane attached tot this flight
    airplane = Airplane.find(Flight.find(@flight.id).airplane_id)

    chars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
    airplane.rows.times do |i|
      airplane.columns.times do |j|
        Reservation.create(flight_id: @flight.id, seat_number: "#{i+1}#{chars[j]}")
      end
    end
    redirect_to flights_path
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @flights = Flight.all
    respond_to do |format|
      format.html
      format.json {render json: @flights, include: ['airplane']}
    end
  end


  def show
    headers['Access-Control-Allow-Origin'] = '*'
    @flight = Flight.find params[:id]
    @airplane = Airplane.find @flight.airplane_id
    @origin = Airport.find_by(code: @flight.origin)
    @destination = Airport.find_by(code: @flight.destination)
    @reservations = Reservation.where(flight_id: @flight.id)
    respond_to do |format|
      format.html
      format.json {render json: @flight, include: ['airplane', 'reservations']}
    end
  end

  def edit
    @flight = Flight.find params[:id]
    @airports = Airport.all.map{|a| [a.name, a.code]}
    @airplanes = Airplane.all.map{|a| [a.name, a.id]}
  end

  def update
    flight = Flight.find params[:id]
    flight.update flight_params
    # find the airplane attached tot this flight
    airplane = Airplane.find(Flight.find(flight.id).airplane_id)

    chars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
    Reservation.where(flight_id: flight.id).destroy_all
    airplane.rows.times do |i|
      airplane.columns.times do |j|
        Reservation.create(flight_id: flight.id, seat_number: "#{i+1}#{chars[j]}")
      end
    end
    redirect_to flights_path
  end

  def destroy
    flight = Flight.find params[:id]
    flight.destroy
    redirect_to flights_path
  end

  def search
    headers['Access-Control-Allow-Origin'] = '*'
    render json: {Flight.where(origin: params[:origin], destination: params[:destination]), include: ['airplane']}
  end


  private

  def flight_params
    params.require(:flight).permit(:flight_number, :origin, :destination, :date, :airplane_id)
  end
end
