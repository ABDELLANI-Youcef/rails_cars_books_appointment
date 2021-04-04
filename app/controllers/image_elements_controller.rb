class ImageElementsController < ApplicationController
  def index
    car = set_car
    image = car.image_element
    image_path = rails_blob_path(image.image)
    json_response(image: image_path)
  end

  def update
    car = set_car
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless car.save!

    json_response(car, :created)
  end

  private

  def set_car
    Car.find(params[:car_id])
  end
end
