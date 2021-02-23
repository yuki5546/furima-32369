require 'rails_helper'

RSpec.describe 'TransactionItems', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/transaction_items/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/transaction_items/new'
      expect(response).to have_http_status(:success)
    end
  end
end
