class Api::V1::SeasonsController < ApplicationController
  def index
    render json: Season.cached_seasons_list, status: :ok
  end
end
