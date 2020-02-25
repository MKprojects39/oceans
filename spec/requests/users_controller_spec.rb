require 'rails_helper'

describe UsersController, type: :request do
   describe 'GET #show' do
   context 'ユーザーが存在する場合' do
      let(:test) { FactoryBot.create :test }

   it 'リクエスト成功' do
        get user_url test.id
        expect(response.status).to eq 200
   end
   end
   end
    describe 'GET #new' do
    it 'リクエスト成功' do
      get new_user_url
      expect(response.status).to eq 200
    end
    end
    describe 'GET #edit' do
    let(:test) { FactoryBot.create :test }

    it 'リクエストが成功すること' do
      get edit_user_url test
      expect(response.status).to eq 302
    end
    end
    describe 'POST #create' do
      it 'リクエスト成功' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response.status).to eq 302
    end

    it 'ユーザー登録成功' do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
    end
    end
    
    describe 'PUT #update' do
    let(:takashi) { FactoryBot.create :test }

    
     it 'リクエスト成功' do
        put :update, params: { id: takashi, user: FactoryBot.attributes_for(:test2) }
        expect(response.status).to eq 302
     end

     it 'ユーザー名更新' do
        expect do
          put :update, params: { id: test, user: FactoryBot.attributes_for(:test2) }
        end.to change { User.find(test.id).name }.from('test').to('test2')
     end
     end
     
    describe 'DELETE #destroy' do
    let!(:user) { FactoryBot.create :user }

    it 'リクエスト成功' do
      delete user_url user
      expect(response.status).to eq 302
    end

    it 'ユーザーが削除' do
      expect do
        delete user_url user
      end.to change(User, :count).by(-1)
    end
    end 
end