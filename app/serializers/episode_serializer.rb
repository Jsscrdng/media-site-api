class EpisodeSerializer < ActiveModel::Serializer
  attributes :id,
             :plot,
             :title,
             :number,
             :created_at,
             :updated_at
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
