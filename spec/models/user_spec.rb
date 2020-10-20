# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:purchases) }
    it { is_expected.to have_many(:purchase_options).through(:purchases) }
  end

  describe 'Validations' do
    it{ is_expected.to validate_presence_of :email }
    it{ is_expected.to validate_uniqueness_of :email }
  end
end
