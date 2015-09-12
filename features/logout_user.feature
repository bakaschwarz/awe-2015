Feature: Logout
  As a logged in User
  I want to log out

  Background:
    Given the database has a user with the mail "example@example.com" and the password "asdf"
    Given the database has a configuration with default values
    Given the database contains the needed visualization types
    And the database contains an api token



  Scenario: A user logs in and logs out
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Sign Out"
    Then I am redirected to the login page