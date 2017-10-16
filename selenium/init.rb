require 'selenium-webdriver'


driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'https://github.com/'

sign_in_element = driver.find_element :xpath, "//a[text()='Sign in']"
sign_in_element.click

login_field = driver.find_element :xpath, "//input[@id='login_field']"
login_field.send_keys 'foo'

pssw_field = driver.find_element :xpath, "//input[@id='password']"
pssw_field.send_keys 'bar'

