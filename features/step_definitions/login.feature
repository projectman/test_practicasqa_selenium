Feature: Authorisation page testing

  Scenario: Pass registration form when username and password are correct then log off
    Given I open the brouser with authorisation page
    When I imput correct username "admin" and correct password "admin"
    Then I can download the page with text "Practical SQA"
    When I can exit the account
    Then I will see the page with Log-in button

  Scenario: Athorisation will not be passed with empty both fields
    Given I open the brouser wth authorisation page
    When I input empty username "" and empty password ""
    Then I will stay on the page with submit button

  Scenario: Athorisation will not be passed with right username empty password
    Given I open the brouser with authorisation page§
    When I input right username "adnim" and empty password ""
    Then I will see the note ": The password field is empty."