class PagesController < ApplicationController
  def home
  end

  def airports
    airports = Airport.all
    respond_to do |format|
      format.html
      format.json {render json: airports}
    end
  end
end
