class Movie < ApplicationRecord
  has_many :purchase_options, as: :purchasable

  # Validations
  validates :title, :presence => true
end

# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  plot       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
