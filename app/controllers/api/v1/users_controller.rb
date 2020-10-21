class Api::V1::UsersController < ApplicationController
  def library
    user = User.find(params[:id])
    purchases = user.purchases.availables.by_creation

    render json: purchases, status: :ok
  end
end
