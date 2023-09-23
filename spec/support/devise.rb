# spec/support/devise.rb

module DeviseTestHelpers
  def login_as(user)
    sign_in user
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :feature
  config.include DeviseTestHelpers, type: :feature
end
