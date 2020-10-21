class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.list_all

    render json: movies, status: :ok, each_serializer: PurchasableSerializer
  end
end