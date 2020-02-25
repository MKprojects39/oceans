require 'rails_helper'
　RSpec.feature "ログインしたらマイページへ遷移", type: :feature do
　  background do
 
    User.create!(name:'user', email: 'mail@example.com', password: '123456')
  end
　　 scenario "login" do
     visit root_path
    fill_in 'name', with: 'user'
    fill_in 'Email', with: 'mail@example.com'
    fill_in 'Password', with: '123456'
    
    click_on 'save'
    
    expect(page).to have_content 'ようこそ'
end
end
