require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      User.create name: 'user1'
      User.create name: 'user2'
    end

    it { is_expected.to eq(200) }
    it { expect(response.body).to eq('aa') }
  end
end
