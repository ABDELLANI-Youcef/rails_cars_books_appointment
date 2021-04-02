class AppointmentsController < ApplicationController

  def index
    size = current_user.appointments.size
    appointments = current_user.appointments.paginate(page: params[:page], per_page: 6)
    json_response({appointments: appointments, size: size})
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
