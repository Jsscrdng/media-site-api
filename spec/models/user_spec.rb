require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:purchases) }
    it { is_expected.to have_many(:purchase_options).through(:purchases) }
  end

  describe 'Validations' do
    it{ is_expected.to validate_presence_of :email }
  end
end
