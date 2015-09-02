When(/^a new user is created with the email "([^"]*)" and the password "([^"]*)"$/) do |arg1, arg2|
  @user = User.new(
      email: arg1,
      password: arg2,
      password_confirmation: arg2
  )
end

Then(/^he is saved with an API token in the database$/) do
   @user.save
end

Then(/^we can retrieve it from the database$/) do
  @user_from_database = User.first
  expect(@user_from_database.api_token).to_not be_nil
end