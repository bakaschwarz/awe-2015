Then(/^I press "([^"]*)"$/) do |arg|
  begin
   click_on(arg)
  rescue
    page.find(arg).click
  end
end