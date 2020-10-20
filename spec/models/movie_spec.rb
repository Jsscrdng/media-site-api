require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:purchase_options) }
  end

  describe 'Validations' do
    it{ is_expected.to validate_presence_of :title }
  end
end
