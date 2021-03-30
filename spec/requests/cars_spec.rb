require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  let!(:user) { create(:user, admin: true) }
  let!(:cars) { create_list(:car, 10) }
  let(:car_id) { cars.first.id }
  let(:headers) { valid_headers }

  # Test suite for POST /cars
  describe 'POST /cars' do
    # valid payload
    let(:valid_attributes) do
      # send json payload
      { mark: 'Bugatti', model: 'veron', year: 2011, price: 500 }.to_json
    end

    

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/cars', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Mark can't be blank, Model can't be blank, Year can't be blank/)
      end
    end
  end

  # Test suite for PUT /cars/:id
  describe 'PUT /cars/:id' do
    let(:valid_attributes) { { mark: 'Bugatti', model: 'chiron', year: 2020, price: 500 }.to_json }

    context 'when the record exists' do
      before { put "/cars/#{car_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for DELETE /cars/:id
  describe 'DELETE /cars/:id' do
    before { delete "/cars/#{car_id}", params: {}, headers: headers }

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end
end
