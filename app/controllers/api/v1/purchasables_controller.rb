class Api::V1::PurchasablesController < ApplicationController
  def index
    data = {
      movies: Movie.cached_movies_list,
      seasons: Season.cached_seasons_list
    }

    render json: data, status: :ok
  end
end
