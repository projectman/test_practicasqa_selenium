Feature: User with valid credentials can log in

  Scenario: Pass registration form when username and password are correct
    Given I open the brouser with authorisation page
    When I imput correct username "admin" and correct password "admin"
    Then I can download the page with text "SQA practics"



