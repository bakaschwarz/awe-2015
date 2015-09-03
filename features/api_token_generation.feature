Feature: API Token Generation
  A new User gets an API token

  Scenario:
    When a new user is created with the email "example@example.com" and the password "asdf"
    And he is saved with an API token in the database
    Then we can retrieve it from the database