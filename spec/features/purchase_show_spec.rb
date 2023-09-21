require 'rails_helper'

RSpec.feature 'PurchaseShows', type: :feature do
  let!(:user) { User.create(name: 'user', email: 'user@example.com', password: 'password') }
  let!(:category) { Category.create(name: 'Groceries', icon: '/uploads/icon.png', user:) }
  let!(:purchase) { Purchase.create(name: 'Milk', amount: 2.99, user:) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button('Log in')
    PurchaseCategory.create(purchase:, category:)
    visit category_purchase_path(category, purchase)
  end

  scenario 'displays purchase details and categories' do
    expect(page).to have_content('Transaction: Milk')
    expect(page).to have_content('Amount: 2.99')

    expect(page).to have_content('Categories:')
    expect(page).to have_content('Groceries')

    expect(page).to have_content('Created At:')
    expect(page).to have_content(purchase.created_at.strftime('%B %d, %Y %I:%M %p'))
  end

  scenario 'navigates back to category page' do
    click_on 'Back'
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'allows signing out' do
    click_on 'Sign Out'
    expect(page).to have_text('LOGIN')
  end
end