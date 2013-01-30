Feature: Campaign management
  In order to communicate with consumers
  As a Marketer
  I want to set up email campaigns

  Background:
    Given a route exists with origin: JFK and destination: ATL

  Scenario: Campaign setup
    When I go to the new campaign page
    And I fill in data for the campaign "A cheap trip" for route "JFK - ATL"
    And I save the campaign
    Then I should see "A CHEAP TRIP" on the campaign page

  Scenario: Activate a campaign
    Given an inactive campaign exists
    Then I should see "INACTIVE" on the campaign page
    When I activate the campaign
    Then I should see "ACTIVE" on the campaign page

  Scenario: Deactivate a campaign
    Given an active campaign exists
    Then I should see "ACTIVE" on the campaign page
    When I deactivate the campaign
    Then I should see "INACTIVE" on the campaign page

  Scenario: Delete a campaign
    Given a campaign exists with name: Cheap flights to Atlanta
    Then I should see "CHEAP FLIGHTS TO ATLANTA" on the campaign page
    When I delete the campaign
    Then I should not see "CHEAP FLIGHTS TO ATLANTA" on the campaign page
    And I should see "CHEAP FLIGHTS TO ATLANTA" on the audit page
    And I should see "destroy" on the audit page
