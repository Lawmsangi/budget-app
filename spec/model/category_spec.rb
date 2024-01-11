require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Category is valid' do
    user = User.new(name: 'Bubu', email: 'bubuemail.com', password: 'password')
    category = Category.new(name: 'Category', icon: 'icon', user:)
    expect(category).to be_valid
  end

  it 'Category is invalid without name' do
    user = User.new(name: 'Bubu', email: 'bubuemail.com', password: 'password')
    category = Category.new(name: '', icon: 'icon', user:)
    expect(category).to_not be_valid
  end

  it 'Category is invalid without icon' do
    user = User.new(name: 'Bubu', email: 'bubuemail.com', password: 'password')
    category = Category.new(name: 'Category', icon: '', user:)
    expect(category).to_not be_valid
  end
end
