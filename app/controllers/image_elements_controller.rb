class ImageElementsController < ApplicationController
  before_action :set_car

  def index
    @image = @car.image_element
    image_path = rails_blob_path(@image.image)
    json_response(image: image_path)
  end

  def update
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.admin
    raise(ExceptionHandler::RecordNotFound, Message.not_found(car)) unless @car.save!

    json_response(@car, :created)
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end
end
