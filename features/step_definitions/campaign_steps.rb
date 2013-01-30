
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

Then(/^I should see the campaign "(.*?)"$/) do |campaign_text|
  page.should have_content("Campaign Listing")
  page.should have_content(campaign_text)
end
