url = "http://old.practicalsqa.net"
username_path = "//input[@id='user_login']"
pass_path = "//input[@id='user_pass']"
button_path = "//input[@id='wp-submit']"


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

  puts "@brouser result: ", @browser.find_element(xpath: "//a[text()='"+head_text+"']" )
end