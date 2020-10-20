class PurchaseOption < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases
  belongs_to :purchasable, polymorphic: true

  validates :price, presence: true
end

# == Schema Information
#
# Table name: purchase_options
#
#  id               :bigint           not null, primary key
#  price            :float
#  purchasable_type :string
#  quality          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :integer
#
