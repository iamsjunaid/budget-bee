require 'rails_helper'

RSpec.feature 'Category Index Page', type: :feature do
  let!(:user) { User.create(name: 'user', email: 'user@example.com', password: 'password') }
  let!(:groceries_category) { Category.create(name: 'Groceries', icon: '/uploads/icon.png', user:) }
  let!(:electronics_category) { Category.create(name: 'Electronics', icon: '/uploads/icon.png', user:) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button('Log in')
  end

  scenario 'displays the categories' do
    visit categories_path
    expect(page).to have_text('Categories')
    expect(page).to have_link('Sign Out')
  end

  scenario 'allows adding a new category' do
    visit categories_path
    expect(page).to have_link('Add a New Category')
    click_link('Add a New Category')
    expect(page).to have_current_path(new_category_path)
  end

  scenario 'allows signing out' do
    visit categories_path
    click_link('Sign Out')
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_text('LOGIN')
  end
end
