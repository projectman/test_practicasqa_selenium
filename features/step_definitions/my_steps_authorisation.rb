# path = File.join(File.dirname(__FILE__), "drivers/chromedriver"
# 
url = "http://old.practicalsqa.net"
username_path = "//input[@id='user_login']"
pass_path = "//input[@id='user_pass']"
button_path = "//input[@id='wp-submit']"
avatar_path = "//*[@id='recallbar']/div[2]/div[2]/a/img"
exit_path = "//*[@id='recallbar']/div[2]/div[2]/div/div[2]/a/span"

# 1. Testing right username, right password
Given(/^I open the brouser with authorisation page$/) do

  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url
  @browser.find_element(xpath: username_path)
  puts "title of the brouser: " + @browser.title

end

When(/^I imput correct username "([^"]*)" and correct password "([^"]*)"$/) do |user, pwrd|

  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click

  sleep(4)

end

Then(/^I can download the page with text "([^"]*)"$/) do |head_text|

  @browser.find_element(xpath: "//a[text()='"+head_text+"']")

end

When(/^I can exit the account$/) do
  # Exit account when push the link "Exit"
  @browser.find_element(xpath: avatar_path).click
  @browser.find_element(xpath: exit_path).click
  sleep(4)

end

Then(/^I will see the page with Log\-in button$/) do
  # I can find the button "Login on authorisation page"
  @browser.find_element(xpath: "//input[@id='wp-submit']")
  puts "Authorisation test #1 passed"
  @browser.quit
end

# 2. Testing empty username, empty password
Given(/^I open the brouser wth authorisation page$/) do
  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url
  # Check that username field exists on page
  @browser.find_element(xpath: username_path)
  puts "title of the brouser: " + @browser.title

end

When(/^I input empty username "([^"]*)" and empty password "([^"]*)"$/) do |user, pwrd|
  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click

  sleep(4)
end

Then(/^I will stay on the page with submit button$/) do
  @browser.find_element(xpath: "//input[@id='wp-submit']")
  puts "Authorisation test #2 passed"
  @browser.quit
end

# 3. Testing right username and empty password
Given(/^I open the brouser with authorisation page 3rd time$/) do
  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url
  # Check that username field exists on page
  @browser.find_element(xpath: username_path)
  puts "title of the brouser Test #3: " + @browser.title
end

When(/^I input right username "([^"]*)" and empty password "([^"]*)"$/) do |user, pwrd|
  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click

  sleep(4)
end

Then(/^I will see the note "([^"]*)"$/) do |warning|
  @browser.find_element(xpath: "//*[text()='"+warning+"']")
  puts "Authorisation test #3 passed"
  @browser.quit
end

# 4. Testing empty username and right password
Given(/^I open the brouser with authorisation page 4th time$/) do
  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url
  # Check that username field exists on page
  @browser.find_element(xpath: username_path)
  puts "title of the brouser Test #4: " + @browser.title
end

When(/^I input empty username "([^"]*)" and right password "([^"]*)"$/) do |user, pwrd|
  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click
  sleep(4)
end

Then(/^I will see the note about username"([^"]*)"$/) do |warning|
  @browser.find_element(xpath: "//*[text()='"+warning+"']")
  puts "Authorisation test #4 passed"
end