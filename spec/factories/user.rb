FactoryBot.define do
  factory :user do
    name { 'Name' }
    email { 'abc@gmail' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
