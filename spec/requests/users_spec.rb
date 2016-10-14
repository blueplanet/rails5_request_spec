require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let!(:users) do
      [
        User.create(name: 'user1'),
        User.create(name: 'user2')
      ]
    end

    it do
      is_expected.to eq(200)
      expect(response.body).to eq(users.map(&:as_json).to_json)
    end
  end

  describe 'POST /users' do
    let(:params) {
      { user: { name: 'test user' } }
    }

    it do
      is_expected.to eq(201)
    end
  end
end
