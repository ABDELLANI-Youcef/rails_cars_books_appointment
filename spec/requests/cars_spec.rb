require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/cars/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/cars/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/cars/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/cars/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
