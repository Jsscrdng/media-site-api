# == Schema Information
#
# Table name: purchases
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  purchase_option_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_purchases_on_purchase_option_id  (purchase_option_id)
#  index_purchases_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_option_id => purchase_options.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:purchase_option) }
  end

  describe 'expired? method' do
    let(:user) { FactoryBot.create(:user, email: Faker::Internet.unique.email) }
    let(:movie) { FactoryBot.create(:movie, title: 'Avengers') }
    let(:purchase_option) { FactoryBot.create(:purchase_option, quality: '1440p', price: 4.5, purchasable: movie) }

    let(:valid_purchase) { FactoryBot.create(:purchase, user: user, purchase_option: purchase_option) }
    let(:expired_purchase) { FactoryBot.create(:purchase, user: user, purchase_option: purchase_option, created_at: Time.now - 3.days) }

    it 'should return true when its called from an expired purchase' do
      expect(expired_purchase.expired?).to be true
    end

    it 'should return false when its called from a valid purchase' do
      expect(valid_purchase.expired?).to be false
    end
  end
end
