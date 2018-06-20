url = "http://old.practicalsqa.net"
username_path = "//input[@id='user_login']"
pass_path = "//input[@id='user_pass']"
button_path = "//input[@id='wp-submit']"
contactme_path = "//a[text()='Contact Me']"      # path to 'Contact Me' button
prime_path = "//button[@class='menu-toggle']"    # path button opening large menu
comment_path = "//textarea[@name='comment']"     # path text field for comment


Given(/^I navigate to Contact me page$/) do
  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url

end

When(/^I login with username "([^"]*)" and password "([^"]*)"$/) do |user, pwrd|
  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: pass_path).send_keys pwrd
  @browser.find_element(xpath: button_path).click
  sleep (2)
end

When(/^I verify the contact me page loaded$/) do
  # if there is menu for small
  # first click menu than contactme_path
  # other way only click contactme_path
  if @browser.find_element(xpath: prime_path)
         .class == Selenium::WebDriver::Element
    @browser.find_element(xpath: prime_path).click
    @browser.find_element(xpath: contactme_path).click
  else
    @browser.find_element(xpath: contactme_path).click
  end

  sleep(2)

end

Then(/^I write the text "([^"]*)"$/) do |comment|
  @browser.find_element(xpath: comment_path).send_keys  comment
end

Then(/^I click button "([^"]*)"$/) do |post_comment|
  @browser.find_element(xpath: "//input[@value='Post Comment']").click
  sleep(5)

end