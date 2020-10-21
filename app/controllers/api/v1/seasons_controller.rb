class Api::V1::SeasonsController < ApplicationController
  def index
    seasons = Season.list_all

    render json: seasons, status: :ok, each_serializer: PurchasableSerializer
  end
end
