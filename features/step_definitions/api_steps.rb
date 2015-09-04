
When(/^we create a new API token$/) do
  @api_token = ApiToken.new(
                           token: SecureRandom.hex
  )
end

And(/^save it$/) do
  @api_token.save
end

Then(/^we can retrieve it from the database$/) do
  expect(ApiToken.first).to_not be_nil
end

