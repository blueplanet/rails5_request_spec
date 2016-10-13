require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      User.create name: 'user1'
      User.create name: 'user2'
    end

    it do
      is_expected.to eq(200)
      expect(response.body).to eq('aa')
    end
  end
end
