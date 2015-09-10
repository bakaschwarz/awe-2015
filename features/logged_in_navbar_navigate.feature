Feature: Navigate the Navigation Bar
  As a logged in user
  I want to navigate all the pages in the navigation bar
  
  Background:
    Given the database has a user with the mail "example@example.com" and the password "asdf"
    Given the database has a configuration with default values
    Given the database contains the needed visualization types


  Scenario: A user logs in and uses the navigation bar and then logs out
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then I press "Dashboard"
    And I will be redirected to the dashboard
    Then I press "Log In Settings"
    And I will be redirected to the user settings
    Then I press "Sign Out"
    Then I am redirected to the login page
    