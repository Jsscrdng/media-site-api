class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases

  validates :email, presence: true
end
