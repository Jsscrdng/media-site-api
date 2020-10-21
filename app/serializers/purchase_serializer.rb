class PurchaseSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :created_at,
             :updated_at

  attribute :purchase do
    object.purchase_option.purchasable
  end
end
