require 'rails_helper'

describe ArticlesController, type: :request do

   describe 'GET #show' do
   context 'ユーザー' do
      let(:test) { FactoryBot.create :test }

   it 'リクエスト成功' do
        get article_url test.id
        expect(response.status).to eq 200
   end
   end
   end
   describe 'GET #new' do
   it 'リクエスト成功' do
      get new_article_url
      expect(response.status).to eq 200
   end
   end
   
    describe 'GET #edit' do
    let(:test) { FactoryBot.create :test }

    it 'リクエスト成功' do
      get edit_article_url test
      expect(response.status).to eq 302
    end
    end
    describe 'POST #create' do
    it 'リクエスト成功' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response.status).to eq 302
    end

    it '投稿成功' do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
    end
    end
    
        
    describe 'PUT #update' do
    let(:test) { FactoryBot.create :test }

    
     it 'リクエスト成功' do
        put :update, params: { id: test, user: FactoryBot.attributes_for(:test2) }
        expect(response.status).to eq 302
     end
     end
     
    describe 'DELETE #destroy' do
    let!(:user) { FactoryBot.create :user }

    it 'リクエスト成功' do
      delete article_url user
      expect(response.status).to eq 302
    end

    it '投稿削除' do
      expect do
        delete article_url user
      end.to change(User, :count).by(-1)
    end
    end 
end