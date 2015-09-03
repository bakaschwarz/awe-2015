And(/^the database contains a sensor with the name "([^"]*)", the label "([^"]*)" and the unit "([^"]*)"$/) do |arg1, arg2, arg3|
  @sensor = Sensor.new(
                      sensor: arg1,
                      label: arg2,
                      unit: arg3,
  )
  @sensor.save
  expect(Sensor.first).to_not be_nil
end

Given(/^there is a JSON File$/) do
  @json_file = {}
end

And(/^it contains the sensor "([^"]*)" and the value "([^"]*)"$/) do |arg1, arg2|
  @json_file[:sensor_id] = Sensor.find_by_sensor(arg1).id
  @json_file[:value] = arg2
end

And(/^it contains the timestamp "([^"]*)" as well as the node "([^"]*)"$/) do |arg1, arg2|
  @json_file[:timestamp] = arg1.to_i
  @json_file[:node] = arg2.to_i
end


When(/^I post it to the server$/) do
  page.driver.post("/weather_update/create", :weather_update => @json_file)
end

Then(/^It will be added to the database$/) do
  expect(SensorDatum.first).not_to be_nil
  puts SensorDatum.first.node
end