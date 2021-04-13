class CarsController < ApplicationController
  include CarHelper
  def index
    cars = Car.all
    response = cars_json(cars)
    json_response(response)
  end

  def create
    current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    params = car_params
    car = Car.new(mark: params[:mark], model: params[:model], year: params[:year], price: params[:price])

    if Car.create_car_with_image(car, car_params)
      json_response(car, :created)
    else
      json_response(car, :unprocessable_entity)
    end
  end

  def destroy
    current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    car = Car.find(params[:id])
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless car.destroy

    json_response({ message: 'car deleted' }, :created)
  end

  def update
    current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin

    car = Car.find(params[:id])
    changements = params[:car]
    car.year = changements[:year]
    car[:mark] = changements[:mark]
    car.model = changements[:model]
    car.price = changements[:price]
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless car.save!

    json_response(car, :created)
  end

  private

  def image_params
    params.permit(:image)
  end

  def car_params
    params.permit(
      :mark,
      :model,
      :year,
      :price,
      :image
    )
  end
end
