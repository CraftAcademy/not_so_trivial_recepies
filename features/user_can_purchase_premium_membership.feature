@javascript
@javascript
Feature: User can purchase premium membership
  As a user
  In order to save my favorite recipes
  I would like to be able to pay for premium membership


  Background:
    Given the following membership exist
      | title   |
      | Premium |

    And the following user exist
      | email        | password |
      | berg@mail.se | 12345678 |
    And I visit the home page
    And I click "Login"
    And I fill in "Email" with "berg@mail.se"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    And I click "Subscription"

  Scenario:
    Given I click on "Buy" for membership
    Then I should be on purchase page
    And I wait 3 seconds
    And I fill in "Email" with "berg@email.se"
    And I fill in the Stripe field "CC Number" with "4242424242424242"
    And I fill in the Stripe field "Expiry date" with "01/2022"
    And I fill in the Stripe field "CVC" with "123"
    And I submit the Stripe form
    And I wait 2 seconds
    Then I should see "Thank you!"