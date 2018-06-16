url = "http://old.practicalsqa.net"
username_path = "//input[@id='user_login']"

Given(/^I open the brouser with authorisation page$/) do

  @browser = Selenium::WebDriver.for :safari
  @browser.navigate.to url


  #element = browser.find_element(name: 'q')
  #element.send_keys "Hello WebDriver!"
  #element.submit

  puts "title of the brouser: " + @browser.title



end

When(/^I imput correct username "([^"]*)" and correct password "([^"]*)"$/) do |user, password|
  puts "username and password: "+user+" "+password

  @browser.find_element(xpath: username_path).send_keys user
  @browser.find_element(xpath: "//input[@id='user_pass']").send_keys password
  @browser.find_element(xpath: "//input[@id='wp-submit']").click


  sleep(5)

end


Then(/^I can download the page with text "([^"]*)"$/) do |head_text|
  puts "argument for search: "+head_text
  xpath_t = "//a[text()='"+head_text+"']"

  #xpath_t = "//a[text()='Practical SQA']"
  puts "xpath_t: "+xpath_t

  puts "@brouser result: ", @browser.find_element(xpath: xpath_t)
end