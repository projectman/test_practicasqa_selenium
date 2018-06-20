url = "http://old.practicalsqa.net"
username_path = "//input[@id='user_login']"
pass_path = "//input[@id='user_pass']"
button_path = "//input[@id='wp-submit']"
contactme_path = "//a[text()='Contact Me']"

Given(/^I navigate to Contact me page$/) do
  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url

end


When(/^I login with username "([^"]*)" and password "([^"]*)"$/) do |user, pwrd|
  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click
  sleep (10)
end

When(/^I verify the contact me page loaded$/) do
  @browser.find_element(xpath: contactme_path).click
end

Then(/^I write the text "([^"]*)"$/) do |arg|
  pending
end

Then(/^I click button "([^"]*)"$/) do |arg|
  pending
end