require 'rails_helper'

RSpec.feature 'Payments Page', type: :feature do
  before do
    @user = create(:user, name: 'Bubu', email: 'bubu@email.com', password: 'password',
                          password_confirmation: 'password')
    sign_in(@user)
    @payment3 = create(:payment, name: 'Payment for category 2', user: @user)
    @category1 = create(:category, name: 'Category 1', icon: 'bi bi-phone', user: @user)
    @category2 = create(:category, name: 'Category 2', icon: 'bi bi-luggage-fill', user: @user)
    @category1.payments << create(:payment, name: 'Payment for category 1', amount: 300, user: @user)
    @category1.payments << create(:payment, name: 'Payment for category 1', amount: 200, user: @user)
    @category2.payments << create(:payment, name: 'Payment for category 2', amount: 50, user: @user)

    visit category_payments_path(@category1)
  end

  scenario 'Displays the list of payments' do
    current_date = Time.now.strftime('%d %b %Y')
    expect(page).to have_content('Payments')
    expect(page).to have_content('Total Amount for Category 1:  $500.00')
    expect(page).to have_content("Payment for category 1 #{current_date}")
    expect(page).to have_content("Payment for category 1 #{current_date}")

    click_link 'New Transaction'
    expect(page).to have_current_path(new_category_payment_path(@category1))
  end
end
