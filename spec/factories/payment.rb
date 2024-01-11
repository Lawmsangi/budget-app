FactoryBot.define do
  factory :payment do
    name { 'Name' }
    amount { 100 }
    user
  end
end
