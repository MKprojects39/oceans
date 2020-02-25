require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  it "コメントに名前がないと無効" do
    comment = Comment.new(name: nil)
    comment.valid?
    expect(comment.errors[:name]).to include("can't be blank")
  end

end

  