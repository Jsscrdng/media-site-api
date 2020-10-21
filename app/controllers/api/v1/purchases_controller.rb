class Api::V1::PurchasesController < ApplicationController
  def create
    user = User.find(params[:id])
    purchase_option = find_purchase_option
    new_purchase = Purchase.create(purchase_option: purchase_option, user: user)

    if new_purchase.save
      render json: new_purchase, status: :created
    else
      render json: { errors: new_purchase.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def find_purchase_option
    PurchaseOption.find_by(purchasable_type: purchase_option_params[:purchasable_type],
                           purchasable_id: purchase_option_params[:purchasable_id],
                           quality: quality)
  end

  def quality
    purchase_option_params[:quality]
  end

  def purchase_option_params
    params.require(:purchase_option).permit(:purchasable_type,
                                            :purchasable_id,
                                            :quality)
  end
end
