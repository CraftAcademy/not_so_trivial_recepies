Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Then("I should be on {string}") do |current_page|
  expect(current_page).to eq actual_path
end

Then("I should be on the home page") do
  expect(current_path).to eq root_path
end

Then("I should be on purchase page") do
  expect(current_path).to eq new_charge_path
end
