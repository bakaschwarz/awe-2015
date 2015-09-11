Given(/^the database has a user with the mail "([^"]*)" and the password "([^"]*)"$/) do |arg1, arg2|
  @user = User.create(
                  email: arg1,
                  password: arg2,
                  password_confirmation: arg2
  )
end

And(/^I visit the dashboard$/) do
  visit static_pages_dashboard_path
end

Then(/^I am redirected to the login page$/) do

end

And(/^I visit the config$/) do
  visit static_pages_wetter_config_path
end

Given(/^I am a user with the mail "([^"]*)" and the password "([^"]*)"$/) do |arg1, arg2|
  @email = arg1
  @password = arg2
end

When(/^I visit the login page$/) do
  visit new_user_session_path
end

And(/^enter my information$/) do
  fill_in("Email", with: @email)
  fill_in("Password", with: @password)
end

And(/^press the login button$/) do
  click_button("Log in")
end

Then(/^I will be redirected to the dashboard$/) do
  expect(current_url == root_url).to be true
end

Given(/^the database has a configuration with default values$/) do
  Config.create(
            user_id: @user.id,
            filter_range: (60*60*2)
  )
end

Given(/^the database contains the needed visualization types$/) do
  VisualizationType.create!([
      {
          name: "Scatter",
          chart_keyword: "scatter"
      },
      {
          name: "Line",
          chart_keyword: "spline"
      },
      {
          name: "Bar",
          chart_keyword: "column"
      },
      {
          name: "Area",
          chart_keyword: "areaspline"
      }
  ])
end