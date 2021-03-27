class AppointmentsController < ApplicationController
  before_action :set_car

  def index
    json_response(@car.appointments)
  end

  def create
    data = appointment_params
    data[:user_id] = current_user.id
    @appointment = @car.appointments.create!(data)
    json_response(@appointment, :created)
  end

  private

  def appointment_params
    params.permit(:date, :city)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
