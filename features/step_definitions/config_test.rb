Given(/^the database contains a station with the label "([^"]*)" and the node number "([^"]*)" and the id "([^"]*)"$/) do |arg1, arg2, arg3|
  @station = Station.create(
             label: arg1,
             node_number: arg2,
             id: arg3
  )
end

Given(/^the database contains a sensor with the label "([^"]*)" and belongs to node number "([^"]*)" and the id "([^"]*)"$/) do |arg1, arg2, arg3|
  @sensor = Sensor.create(
            label: arg1,
            abbreviation: arg1,
            station_id: Station.find_by_node_number(arg2).id,
            id: arg3
  )
end

When(/^I press "([^"]*)" on the station "([^"]*)" with the id "([^"]*)"$/) do |arg1, arg2, arg3|
  click_link("station_#{arg3}")
end

When(/^I press "([^"]*)" on the sensor "([^"]*)" with the id "([^"]*)"$/) do |arg1, arg2, arg3|
  click_link("sensor_#{arg3}")
end

Then(/^I am redirected to the edit page for that station$/) do
  expect(current_url == station_url(@station)).to be true
end

And(/^I input "([^"]*)" into the node number field\.$/) do |arg|
  fill_in( "Node number" ,with: arg)
end

Then(/^I will get an error saying "([^"]*)"$/) do |arg|
  expect(page).to have_content arg
end

Then(/^I am redirected to the edit page for that sensor$/) do
  expect(current_url == sensor_url(@sensor)).to be true
end

And(/^I input blanks in every field$/) do #For stations
  fill_in("Node number", with: "")
  fill_in("Label", with: "")
  fill_in("Description", with: "")
end

Then(/^i input a random valid number into defaults range$/) do
  fill_in("default_range", with: Random.rand(0..1000))
end

Then(/^i type "([^"]*)" into the defaults range$/) do |arg|
  fill_in("default_range", with: arg)
end

And(/^I will be redirected to the new sensor page$/) do
  expect(current_url == new_sensor_url).to be true
end

Then(/^I input some random valid things into the sensor creation$/) do
  pending
end

Then(/^I input some random invalid things into the sensor creation$/) do
  pending
end

And(/^I will be redirected to the new station page$/) do
  pending
end

Then(/^I input some random valid things into the station creation$/) do
  pending
end

Then(/^I input some random invalid things into the station creation$/) do
  pending
end