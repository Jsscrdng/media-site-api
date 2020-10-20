class Movie < ApplicationRecord
  has_many :purchase_options, as: :purchasable

  # Validations
  validates :title, :presence => true
end
