class Purchase < ApplicationRecord
  AVAILABILITY = 2.days.freeze

  belongs_to :user
  belongs_to :purchase_option
end
