Feature: Login
  As a user
  I want to login

  Background:
    Given the database has a user with the mail "example@example.com" and the password "asdf"

  Scenario: Logged out user visits the dashboard
    When I am not logged in
    And I visit the dashboard
    Then I am redirected to the login page

  Scenario: Logged out user visits the config
    When I am not logged in
    And I visit the config
    Then I am redirected to the login page

  Scenario: Logged out user logs in
    Given I am a valid user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard