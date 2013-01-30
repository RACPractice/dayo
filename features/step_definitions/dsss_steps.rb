When(/^I fetch new DSSS packages$/) do
  visit dsss_packages_path
  click_link "Get new packages"
end

Then(/^I should see "(.*?)" on the DSSS page$/) do |dsss_text|
  visit dsss_packages_path
  page.should have_content("DSSS Packages")
  page.should have_content(dsss_text)
end