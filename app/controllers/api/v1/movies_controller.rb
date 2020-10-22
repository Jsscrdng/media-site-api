class Api::V1::MoviesController < ApplicationController
  def index
    render json: Movie.cached_movies_list, status: :ok
  end
end