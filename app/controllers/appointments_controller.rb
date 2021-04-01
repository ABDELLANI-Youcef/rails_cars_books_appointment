class AppointmentsController < ApplicationController

  def index
    json_response(current_user.appointments)
  end

  def create
    car = set_car
    data = appointment_params
    data[:user_id] = current_user.id
    @appointment = car.appointments.create!(data)
    json_response(@appointment, :created)
  end

  private

  def appointment_params
    params.permit(:date, :city)
  end

  def set_car
    Car.find(params[:car_id])
  end
end
