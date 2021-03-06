require 'cucumber/rails'
require 'webmock/cucumber'
ActionController::Base.allow_rescue = false
WebMock.allow_net_connect!

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock)
end

Cucumber::Rails::Database.javascript_strategy = :truncation
Before '@get_recipes' do
  stub_request(:get, "https://api.spoonacular.com/recipes/findByIngredients").
  with(
    query: {
      ingredients: "apples",
      apiKey: Rails.application.credentials.food_api[:api_key]
    }
  ).
  to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'food_api_response.json').read, headers: {})

  stub_request(:get, "https://api.spoonacular.com/recipes/936707/information").
  with(
    query: {
      apiKey: Rails.application.credentials.food_api[:api_key]
    }
  ).
  to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'dried_apples_api_response.json').read, headers: {})
end