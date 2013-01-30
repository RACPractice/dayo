Feature: Campaign management
  In order to communicate with consumers
  As a Marketer
  I want to set up email campaigns

  Scenario: Campaign setup
    Given a route exists with origin: JFK and destination: ATL
    When I go to the new campaign page
    And I fill in data for the campaign "A cheap trip" for route "JFK - ATL"
    And I save the campaign
    Then I should see the campaign "A CHEAP TRIP"
