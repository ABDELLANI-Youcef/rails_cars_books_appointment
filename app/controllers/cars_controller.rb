class CarsController < ApplicationController

  def create
    @car = Car.create!(car_params)
    json_response(@todo, :created)
  end

  private

  def car_params
    params.permit(:mark, :model, :year)
  end
end
