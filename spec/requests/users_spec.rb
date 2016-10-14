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

    context 'パラメータが正しい場合' do
      it do
        expect {
          is_expected.to eq(201)
        }.to change(User, :count).by(1)
      end
    end
    context 'パラメータが正しくない場合' do
      context 'nameが空の場合' do
        let(:params) { { user: { user: nil } } }
        it do
          expect {
            is_expected.to eq(422)
          }.to_not change(User, :count)

          expect(response.body).to eq({ name: [I18n.t('activerecord.errors.blank')]}.to_json)
        end
      end
    end
  end
end
