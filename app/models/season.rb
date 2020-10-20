class Season < ApplicationRecord
  has_many :purchase_options, as: :purchasable
  has_many :episodes

  # Validations
  validates :title, :presence => true
end
