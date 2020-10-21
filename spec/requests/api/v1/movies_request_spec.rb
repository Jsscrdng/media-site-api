require 'rails_helper'

RSpec.describe "Api::V1::Movies", type: :request do
  describe 'GET #index' do
    let!(:movies_list) { FactoryBot.create_list(:movie, 10) }

    it "returns http success" do
      get "/api/v1/movies"
      expect(response.status).to eq 200
    end

    it "list all movies" do
      get "/api/v1/movies"
      expect(json_response.pluck(:id)).to match_array(movies_list.pluck(:id))
    end

    it "list movies ordered by creation" do
      get "/api/v1/movies"
      expect(json_response.pluck(:id)).to match_array(Movie.list_all.ids)
    end
  end
end
