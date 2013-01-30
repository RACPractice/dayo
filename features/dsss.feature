Feature: DSSS
  In order to communicate with consumers
  As a Marketer
  I want to publish email campaigns to ESPs

  Background:
    Given a route exists with origin: JFK and destination: ATL
    And a campaign exists with name: Cheap flights to Atlanta

  Scenario: Fetch new DSSS packages
    When I fetch new DSSS packages
    Then I should see "CHEAP FLIGHTS TO ATLANTA" on the DSSS page
