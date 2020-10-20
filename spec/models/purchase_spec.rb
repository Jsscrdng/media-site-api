require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:purchase_option) }
  end
end
