class Season < ApplicationRecord
  has_many :purchase_options, as: :purchasable
  has_many :episodes

  # Validations
  validates :title, :presence => true

  # scope
  scope :list_all, -> { all.order(created_at: :desc) }
end

# == Schema Information
#
# Table name: seasons
#
#  id         :bigint           not null, primary key
#  number     :integer
#  plot       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
