class PurchaseOption < ApplicationRecord
  QUALITIES = { 'sd' => 0, 'hd' => 1, '1080p' => 2, '1440p' => 3, '4k': 4}.freeze
  has_many :purchases
  has_many :users, through: :purchases
  belongs_to :purchasable, polymorphic: true

  validates :price, presence: true

  enum quality: QUALITIES
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
