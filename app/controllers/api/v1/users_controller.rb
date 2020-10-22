class Api::V1::UsersController < ApplicationController
  def library
    purchasables = Purchase.availables.by_creation
                           .where(user_id: params[:id]).map { |x| x.purchase_option.purchasable }

    render json: purchasables, status: :ok, each_serializer: PurchasableSerializer
  end
end
