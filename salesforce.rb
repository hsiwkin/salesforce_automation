require 'rubygems'
require 'selenium-webdriver'

# module LoginData
#   LOGIN = '<login>'
#   PASSWORD = '<password>'
# end
require_relative 'login_data'


def salesforce_login(driver)
  driver.find_element(:id, 'username').send_key LoginData::LOGIN
  driver.find_element(:id, 'password').send_key LoginData::PASSWORD
  driver.find_element(:id, 'Login').click
end

firefox_driver = Selenium::WebDriver.for :firefox
firefox_driver.manage.timeouts.implicit_wait = 30

my_cases_url = 'https://na29.salesforce.com/500?fcf=00B80000008zzXC'
firefox_driver.get my_cases_url

if firefox_driver.current_url.include? 'login'
  salesforce_login firefox_driver
end


# SELECTING VALUES IN XPATH
# case numbers: $x("//*[contains(@id, 'CASE_NUMBER')]")
# contact name: $x("//*[contains(@id, 'NAME')]")
# subject: $x("//*[contains(@id, 'SUBJECT')]")