FactoryBot.define do
  factory :movie do
    plot { Faker::Movie.quote }
    title { Faker::Movie.title }
  end
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
