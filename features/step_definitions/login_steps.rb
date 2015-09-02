Given(/^the database has a user with the mail "([^"]*)" and the password "([^"]*)"$/) do |arg1, arg2|
  @user = User.create(
                  email: arg1,
                  password: arg2,
                  password_confirmation: arg2
  )
end

When(/^I am not logged in$/) do
  unless @user.logged_in?
    raise
  end
end

And(/^I visit the dashboard$/) do
  pending
end

Then(/^I am redirected to the login page$/) do
  pending
end

And(/^I visit the config$/) do
  pending
end

Given(/^I am a valid user with the mail "([^"]*)" and the password "([^"]*)"$/) do |arg1, arg2|
  pending
end

When(/^I visit the login page$/) do
  pending
end

And(/^enter my information$/) do
  pending
end

And(/^press the login button$/) do
  pending
end

Then(/^I will be redirected to the dashboard$/) do
  pending
end