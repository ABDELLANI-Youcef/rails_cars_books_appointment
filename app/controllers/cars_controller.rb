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

  def destroy
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    @car = Car.find(params[:id])
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless @car.destroy

    json_response({ message: 'car deleted' }, :created)
  end

  private

  def car_params
    params.permit(:mark, :model, :year)
  end
end
