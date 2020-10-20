# == Schema Information
#
# Table name: purchase_options
#
#  id               :bigint           not null, primary key
#  price            :float
#  purchasable_type :string
#  quality          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :integer
#
require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:purchasable) }
    it { is_expected.to have_many(:purchases) }
    it { is_expected.to have_many(:users).through(:purchases) }
  end

  describe 'Validations' do
    it{ is_expected.to validate_presence_of :price }
  end
end
