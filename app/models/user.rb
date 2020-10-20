class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases

  validates :email, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
