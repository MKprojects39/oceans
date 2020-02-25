require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  
  it "投稿に tag, content, 外部キー（user_id）があれば有効" do
      user = @user
      article = user.articles.build(
      article_tag: "tag",
      content: "gu",
      user_id: 0
      )
    expect(article).to be_valid
  
  end
  
   
  it "投稿に外部キーなしだと無効" do
    article = Article.new(user_id: nil)
    article.valid?
    expect(article.errors[:user_id]).to include("can't be blank")
  end
  
  
  it "投稿にcontentがないと無効" do
    article = Article.new(content: nil)
    article.valid?
    expect(article.errors[:content]).to include("can't be blank")      
  end
  
    
  it "投稿にタグがないと無効" do
    article = Article.new(article_tag: nil)
    article.valid?
    expect(article.errors[:article_tag]).to include("can't be blank")
  end
  
end
