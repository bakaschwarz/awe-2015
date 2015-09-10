And(/^I will be redirected to the configuration$/) do
  expect(current_url == static_pages_wetter_config_url).to be true
end

And(/^I will be redirected to the user settings$/) do
  expect(current_url == edit_user_registration_url).to be true
end