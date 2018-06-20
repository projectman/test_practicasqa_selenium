Feature: Contact me testing

@contact

  Scenario: Leaving a Comment in contact me page
    Given I navigate to Contact me page
    When I login with username "admin" and password "admin"
    When I verify the contact me page loaded
    Then I write the text "Wiva cucumber"
    Then I click button "Post comment"

