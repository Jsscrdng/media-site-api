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
FactoryBot.define do
  factory :purchase_option do
    
  end
end
