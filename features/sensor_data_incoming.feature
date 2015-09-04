Feature: A post request for updating the sensor database
  A post request will be send at a specific address
  That contains an api key and sensor data
  Which will be added to the database

  Background:
    Given the database has a user with the mail "example@example.com" and the password "asdf"
    And the database contains a sensor abbreviation "tm1", with the name "sensor_1", the label "temperature" and the unit "°C"
    And the database contains an api token

  Scenario: Making a valid post request
    Given there is a JSON File
    And it contains the sensor abbreviation "tm1" and the value "23"
    And it contains the timestamp "1441265184"
    And it contains the correct API Token
    When I post it to the server
    Then It will be added to the database

  Scenario: Making an invalid post request
    Given there is a JSON File
    And it contains the sensor abbreviation "tm1" and the value "23"
    And it contains the timestamp "1441265184"
    When I post it to the server with the invalid token "badtoken"
    Then the post will be rejected

  Scenario: Making an valid post request with a new sensor
    Given there is a JSON File
    And it contains the sensor abbreviation "newsensor" and the value "23"
    And it contains the timestamp "1441265184"
    And it contains the correct API Token
    When I post it to the server
    Then It will be added to the database