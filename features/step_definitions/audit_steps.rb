Then(/^I should see "(.*?)" on the audit page$/) do |audit_text|
  visit audits_path
  page.should have_content("Audits of latest changes")
  page.should have_content(audit_text)
end
