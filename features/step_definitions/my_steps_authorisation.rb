url = "http://old.practicalsqa.net"

Given(/^I open the brouser with authorisation page$/) do

  browser = Selenium::WebDriver.for :safari
  browser.navigate.to url


  #element = browser.find_element(name: 'q')
  #element.send_keys "Hello WebDriver!"
  #element.submit

  puts "title of the brouser: " + browser.title

  sleep(10)
  browser.quit

end

When(/^I imput correct username "([^"]*)" and correct password "([^"]*)"$/) do
end

Then(/^I can download the page with text "([^"]*)"$/) do |arg|
  pending
end