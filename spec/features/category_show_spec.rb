require 'rails_helper'

RSpec.feature 'Category Show Page', type: :feature do
  let!(:user) { User.create(name: 'user', email: 'user@example.com', password: 'password') }

  before do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button('Log in')
    @groceries_category = Category.create(name: 'Groceries', icon: '/uploads/icon.png', user: user)
    purchase1 = Purchase.create(name: 'Milk', amount: 2.99, user: user)
    purchase2 = Purchase.create(name: 'Bread', amount: 1.99, user: user)
    PurchaseCategory.create(purchase: purchase1, category: @groceries_category)
    PurchaseCategory.create(purchase: purchase2, category: @groceries_category)
  end
  
  scenario 'displays category details and purchases' do
    visit category_path(@groceries_category)
    expect(page).to have_content('Groceries')
    expect(page).to have_content('Total Amount: $4.98')
    expect(page).to have_content('Milk: $2.99')
    expect(page).to have_content('Bread: $1.99')
  end
  
  scenario 'navigates back to categories index' do
    visit category_path(@groceries_category)
    click_on 'Back'
    expect(page).to have_current_path(categories_path)
  end
  
  scenario 'allows adding a new purchase' do
    visit category_path(@groceries_category)
    click_on 'Add a New Purchase'
    expect(page).to have_current_path(new_category_purchase_path(@groceries_category))
  end
  
  scenario 'allows signing out' do
    visit category_path(@groceries_category)
    click_on 'Sign Out'
    expect(page).to have_text('LOGIN')
  end
end
