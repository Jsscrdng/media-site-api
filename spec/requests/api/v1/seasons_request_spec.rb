require 'rails_helper'

RSpec.describe "Api::V1::Seasons", type: :request do

  describe "GET " do
    it "returns http success" do
      get "/api/v1/seasons"
      expect(response).to have_http_status(:ok)
    end
  end

end
