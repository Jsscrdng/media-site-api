FactoryBot.define do
  factory :episode do
    number { nil}
    plot { Faker::Movie.quote }
    title { Faker::Movie.title }
  end
end

# == Schema Information
#
# Table name: episodes
#
#  id         :bigint           not null, primary key
#  number     :integer
#  plot       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint           not null
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
