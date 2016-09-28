FactoryGirl.define do
  factory :user do
    user_name 'bobtomato'
    email 'test@test.com'
    password '123456'
    factory(:admin) do
      admin true
    end
  end
end
