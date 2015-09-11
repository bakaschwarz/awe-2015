Feature: Use the Configuration
  Config all the things™


  Background:
    Given the database has a user with the mail "example@example.com" and the password "asdf"
    Given the database has a configuration with default values
    Given the database contains the needed visualization types
    Given the database contains a station with the label "Teststation" and the node number "1" and the id "1"
    Given the database contains a sensor with the label "Testsensor" and belongs to node number "1" and the id "1"

  Scenario: Editing a station (valid input)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    When I press "Edit" on the station "Teststation" with the id "1"
    Then I am redirected to the edit page for that station
    Then I press "Update Station"
    And I will be redirected to the configuration

  Scenario: Editing a station (invalid input)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    When I press "Edit" on the station "Teststation" with the id "1"
    Then I am redirected to the edit page for that station
    And I input "Hallo Welt" into the node number field.
    Then I press "Update Station"
    Then I will get an error saying "Illegal Input"

  Scenario: Editing a sensor (valid input)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    When I press "Edit" on the sensor "Testsensor" with the id "1"
    Then I am redirected to the edit page for that sensor
    Then I press "Update Sensor"
    And I will be redirected to the configuration

  Scenario: Editing a sensor (invalid input)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    When I press "Edit" on the sensor "Testsensor" with the id "1"
    Then I am redirected to the edit page for that sensor
    And I input blanks in every field
    Then I press "Update Sensor"
    Then I will get an error saying "Illegal Input"

  Scenario: Editing the default time range (valid input)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then i input a random valid number into defaults range
    Then I press "Update Defaults"
    And I will be redirected to the configuration

  Scenario: Editing the default time range (invalid input)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then i type "Invalid Input" into the defaults range
    Then I press "Update Defaults"
    Then I will get an error saying "Illegal Input"
    
  Scenario: Add a new sensor (valid)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then I press "Create new sensor"
    And I will be redirected to the new sensor page
    Then I input some random valid things into the sensor creation
    Then I press "Create Sensor"
    And I will be redirected to the configuration

  Scenario: Add a new sensor (invalid)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then I press "Create new sensor"
    And I will be redirected to the new sensor page
    Then I input some random invalid things into the sensor creation
    Then I press "Create Sensor"
    Then I will get an error saying "Illegal Input"

  Scenario: Add a new station (valid)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then I press "Create new station"
    And I will be redirected to the new station page
    Then I input some random valid things into the station creation
    Then I press "Create Station"
    And I will be redirected to the configuration

  Scenario: Add a new station (invalid)
    Given I am a user with the mail "example@example.com" and the password "asdf"
    When I visit the login page
    And enter my information
    And press the login button
    Then I will be redirected to the dashboard
    Then I press "Configuration"
    And I will be redirected to the configuration
    Then I press "Create new station"
    And I will be redirected to the new station page
    Then I input some random invalid things into the station creation
    Then I press "Create Station"
    Then I will get an error saying "Illegal Input"