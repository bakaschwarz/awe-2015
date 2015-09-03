Feature: API Token Generation
  A new API token gets generated

  Scenario:
    When we create a new API token
    And save it
    Then we can retrieve it from the database