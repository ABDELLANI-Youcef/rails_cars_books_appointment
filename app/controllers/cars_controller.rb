class CarsController < ApplicationController
  def index
    @cars = Car.all
    json_response(@cars)
  end

  def create
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    @car = Car.create!(car_params)
    json_response(@car, :created)
  end

  private

  def car_params
    params.permit(:mark, :model, :year)
  end
end
