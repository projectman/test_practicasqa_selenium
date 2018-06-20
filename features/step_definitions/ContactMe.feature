Feature: Contact me testing

@contact

  Scenario: Leaving a Comment in contact me page
    Given I navigate to Contact me page
    When I login with username "alfha" and password "alfa"
    When I verify the contact me page loaded
    Then I write the text "Viva cucumber!"
    Then I click button "Post comment"

