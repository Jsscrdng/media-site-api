require 'rails_helper'

RSpec.describe "Api::V1::Seasons", type: :request do

  describe "GET " do
    let!(:seasons_list) { FactoryBot.create_list(:season, 10) }
    let(:season_with_episodes) { FactoryBot.create(:season) }

    let(:episodes) { FactoryBot.create_list(:episode, 3, season: season_with_episodes) }

    it "returns http success" do
      get "/api/v1/seasons"
      expect(response.status).to eq 200
    end

    it "list all seasons" do
      get "/api/v1/seasons"
      expect(json_response.pluck(:id)).to match_array(seasons_list.pluck(:id))
    end

    it "list seasons ordered by creation" do
      get "/api/v1/seasons"
      expect(json_response.pluck(:id)).to match_array(Season.list_all.ids)
    end

    it "list seasons with episodes" do
      episodes
      get "/api/v1/seasons"
      expect(json_response.find { |x| x[:id] == season_with_episodes.id }[:episodes].pluck(:id)).to match_array(episodes.pluck(:id))
    end
  end

end
