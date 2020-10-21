class PurchaseOption < ApplicationRecord
  QUALITIES = { 'sd' => 0, 'hd' => 1, '1080p' => 2, '1440p' => 3, '4k' => 4}.freeze
  PRICE = 2.99

  has_many :purchases
  has_many :users, through: :purchases
  belongs_to :purchasable, polymorphic: true

  before_create :set_price, if: -> { self.price.blank? }

  enum quality: QUALITIES

  def set_price
    self.price = PRICE
  end
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
