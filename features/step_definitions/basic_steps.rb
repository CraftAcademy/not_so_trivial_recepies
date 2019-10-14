Given("the following membership exist") do |table|
  table.hashes.each do |membership_hash| 
    FactoryBot.create(:membership, membership_hash)
  end
end

Given("I click on {string} for membership") do |button_text|
  membership = Membership.find_by_title("Premium")
  click_on button_text
end

Given("I visit the home page") do
  visit root_path
end

Given("I click {string}") do |element|
  click_on element
end

Given("the following user exist") do |table|
  table.hashes.each do |user_hash|
    FactoryBot.create(:user, user_hash)
  end
end

Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

Given("I fill in {string} with {string}") do |string, string2|
  fill_in string, with: string2
end

Then("I wait {int} seconds") do |seconds|
  sleep seconds
end
