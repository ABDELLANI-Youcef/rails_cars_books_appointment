require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:car) { create(:car) }
  let!(:appointments) { create_list(:appointment, 20, car_id: car.id, user_id: user.id) }
  let(:car_id) { car.id }
  let(:id) { appointments.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /cars/:car_id/appointments
  describe 'GET /cars/:car_id/appointments' do
    before { get "/cars/#{car_id}/appointments", params: {}, headers: headers }

    context 'when car exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all car appointments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when car does not exist' do
      let(:car_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Car/)
      end
    end
  end

  # Test suite for PUT /cars/:car_id/appointments
  describe 'POST /cars/:car_id/appointments' do
    let(:valid_attributes) { { city: 'Ain oussera', date: '2021-3-30' }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/cars/#{car_id}/appointments", params: valid_attributes, headers: headers
      end

      it 'returns status code 201' do
        puts json
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/cars/#{car_id}/appointments", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: City can't be blank, Date can't be blank/)
      end
    end
  end
end
