
Given(/^an inactive campaign exists$/) do
  FactoryGirl.create(:campaign, :inactive)
end

Given(/^an active campaign exists$/) do
  FactoryGirl.create(:campaign, :active)
end

Given(/^a campaign exists with name: (.*?)$/) do |name|
  FactoryGirl.create(:campaign, name: name)
end

When(/^I go to the new campaign page$/) do
  visit campaigns_path
  click_link "New Campaign"
end

When(/^I fill in data for the campaign "(.*?)" for route "(.*?)"$/) do |campaign_name, route_text|
  fill_in "Name",                 with: campaign_name
  select route_text, from: "Routes text"
  fill_in "Base airlines",        with: "Delta"
  fill_in "Comparative airlines", with: "American"
  fill_in "Advance days",         with: "14"
  fill_in "Length of stay",       with: "5"
  fill_in "Score",                with: "5"
end

When(/^I save the campaign$/) do
  click_button "Create Campaign"
  page.should have_content("Campaign was successfully created")
  click_link "Back"
end

When(/^I delete the campaign$/) do
  visit campaigns_path
  click_link "Destroy"
 # page.driver.browser.switch_to.alert.accept
end

When(/^I activate the campaign$/) do
  visit campaigns_path
  click_link "Activate"
  page.should have_content("activated")
  click_link "Back"
end

When(/^I deactivate the campaign$/) do
  visit campaigns_path
  click_link "Deactivate"
  page.should have_content("deactivated")
  click_link "Back"
end

Then(/^I should see "(.*?)" on the campaign page$/) do |campaign_text|
  visit campaigns_path
  page.should have_content("Campaign Listing")
  page.should have_content(campaign_text)
end

Then(/^I should not see "(.*?)" on the campaign page$/) do |campaign_text|
  visit campaigns_path
  page.should have_content("Campaign Listing")
  page.should_not have_content(campaign_text)
end
