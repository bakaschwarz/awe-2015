And(/^the database contains a sensor abbreviation "([^"]*)", with the name "([^"]*)", the label "([^"]*)" and the unit "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  @sensor = Sensor.new(
                      abbreviation: arg1,
                      sensor: arg2,
                      label: arg3,
                      unit: arg4,
                      station_id: 1
  )
  @sensor.save
  expect(Sensor.first).to_not be_nil
end

Given(/^there is a JSON File$/) do
  @json_file = {}
end

And(/^it contains the sensor abbreviation "([^"]*)" and the value "([^"]*)"$/) do |arg1, arg2|
  @json_file[arg1.to_sym] = arg2
end

And(/^it contains the timestamp "([^"]*)"$/) do |arg1|
  @json_file[:_t] = arg1
  @json_file[:_n] = 1
end

And(/^it contains the correct API Token$/) do
  # Nothing more; Now directly in post
end

When(/^I post it to the server$/) do
  page.driver.post("/weather_update/create", {s_d: [@json_file], api_token: @api_token.token})
end

Then(/^It will be added to the database$/) do
  expect(SensorDatum.first).not_to be_nil
end

And(/^the database contains an api token$/) do
  @api_token = ApiToken.new(
                           token: SecureRandom.hex
  )
  @api_token.save
end

Then(/^the post will be rejected$/) do
  expect(SensorDatum.first).to be_nil
end

When(/^I post it to the server with the invalid token "([^"]*)"$/) do |arg|
  page.driver.post("/weather_update/create", {:s_d => [@json_file], :api_token => arg})
end