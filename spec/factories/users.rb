FactoryBot.define do
  factory :user do
            name {"hiro"}
        sequence(:email) { |n| "hiro#{n}@example.com"}
        password {"password"}
        
  end
  factory :test, class: User do
    name {"test"}
    email {"test@example.com"}
    password {"password"}
  end


end
