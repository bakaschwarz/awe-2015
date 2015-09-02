And(/^I will be redirected to the configuration$/) do
  expect(current_url == static_pages_wetter_config_url).to be true
end