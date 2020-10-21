FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
  end
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
