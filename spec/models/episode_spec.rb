require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:season) }
  end

  describe 'Validations' do
    it{ is_expected.to validate_presence_of :title }
  end
end
