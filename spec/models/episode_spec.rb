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
require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:season) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe 'Callbacks' do
    let!(:season) { FactoryBot.create(:season) }
    let(:first_episode) { FactoryBot.create(:episode, season: season, number: 9) }
    let(:episode_list) { FactoryBot.create_list(:episode, 10, season: season) }
    let(:n_episode) { FactoryBot.create(:episode, season: season) }

    describe 'assign_number' do
      it 'number should be equal to 1 when there is any episode inside season' do
        expect(first_episode.number).to eq 1
      end

      it 'number should be equal to number of episodes in season +1' do
        episode_list

        expect(n_episode.number).to eq season.episodes.size + 1
      end
    end
  end
end
