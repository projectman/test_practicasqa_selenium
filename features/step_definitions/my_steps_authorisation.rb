url = "http://old.practicalsqa.net"
username_path = "//input[@id='user_login']"
pass_path = "//input[@id='user_pass']"
button_path = "//input[@id='wp-submit']"
avatar_path = "//*[@id='recallbar']/div[2]/div[2]/a/img"
exit_path = "//*[@id='recallbar']/div[2]/div[2]/div/div[2]/a/span"


Given(/^I open the brouser with authorisation page$/) do

  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url
  # Check that username field exists on page
  @browser.find_element(xpath: username_path)
  puts "title of the brouser: " + @browser.title

end

When(/^I imput correct username "([^"]*)" and correct password "([^"]*)"$/) do |user, pwrd|

  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click

  sleep(5)

end

Then(/^I can download the page with text "([^"]*)"$/) do |head_text|

  @browser.find_element(xpath: "//a[text()='"+head_text+"']")
  puts "Authorisation test #1 passed"


end

When(/^I can exit the account$/) do
  # Exit account when push the link "Exit"
  @browser.find_element(xpath: avatar_path).click
  @browser.find_element(xpath: exit_path).click
  sleep(5)

end

Then(/^I will see the page with Log\-in button$/) do
  # I can find the button "Login on authorisation page"
  @browser.find_element(xpath: "//input[@id='wp-submit']")
  @browser.quit
end


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

  sleep(5)
end

Then(/^I will stay on the page with submit button$/) do
  @browser.find_element(xpath: "//input[@id='wp-submit']")
  puts "Authorisation test #2 passed"
  @browser.quit
end


