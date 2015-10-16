Given /^the element "([^*$])" should exist$/ do |element|
  page.should have_selector(element)
end 

When /^I press "([^*$])"$/ do |button|
  click_button(button)
end

Then /^I should be on the "([^*$])" page$/ do
  expect(response).to have_http_status(:success)
end
