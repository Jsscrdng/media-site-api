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
    it{ is_expected.to validate_presence_of :title }
  end
end
