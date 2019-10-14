Feature: Premium user can save recipe to cookbook
  As a paid user
  In order to review saved recipes
  I would like to see a cookbook with my saved recipes

  Background:
  Given the following user exists
  | email            | password    |
  | johndoe@mail.com | password123 |
  And I am logged in as "johndoe@mail.com"

  Scenario: Premium user saves recipe to cookbook
    Given I visit the home page
    When I fill in "Search" with "apples"
    And I click "Submit"
    And I click "Dried Apples"
    Then I should see "Position racks in the upper and lower third of the oven; preheat to 200F. Line 2 large baking sheets with parchment paper."
    And I should see "Save to Cookbook"
    And I click "Save to Cookbook"
    Then I should see "Cookbook Recipes"