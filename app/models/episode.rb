class Episode < ApplicationRecord
  belongs_to :season

  # Validations
  validates :title, :presence => true
end
