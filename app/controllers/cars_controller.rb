class CarsController < ApplicationController
  include CarHelper
  def index
    cars = Car.all
    response = cars_json(cars)
    json_response(response)
  end

  def create
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    car = Car.create!(car_params)
    car.create_image(image_params)
    json_response(car, :created)
  end

  def destroy
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    @car = Car.find(params[:id])
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless @car.destroy

    json_response({ message: 'car deleted' }, :created)
  end

  def update
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    @car = Car.find(params[:id])
    changements = params[:car]
    @car.year = changements[:year]
    @car[:mark] = changements[:mark]
    @car.model = changements[:model]
    @car.price = changements[:price]
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless @car.save!

    json_response(@car, :created)
  end

  private

  def image_params
    params.permit(:image)
  end

  def car_params
    params.permit(:mark, :model, :year, :price)
  end
end
