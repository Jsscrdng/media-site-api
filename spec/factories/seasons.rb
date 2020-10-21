FactoryBot.define do
  factory :season do
    plot { Faker::Movie.quote }
    title { Faker::Movie.title }
  end
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
