require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe 'GET #library' do
    let(:user) { FactoryBot.create(:user) }
  end
end
