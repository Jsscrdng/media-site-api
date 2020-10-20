class PurchaseOption < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases
  belongs_to :purchasable, polymorphic: true

  validates :price, presence: true
end
