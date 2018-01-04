require 'selenium-webdriver'

DEPART_DATE = (Time.now + 4*24*60*60).strftime('%m %d %Y')
RETURN_DATE = (Time.now + 14*24*60*60).strftime('%m %d %Y')
COMFORT_CLASSES = {:economy => 'Economy', :comfort => 'Economy Comfort', :saga => 'Saga Class'}

DEPART_CITY = 'Dallas/Ft Worth (DFW) USA'
RETURN_CITY = 'Helsinki (HEL) Finland'

BASE_URL = 'http://www.icelandair.us/'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def initalize_selenium
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to BASE_URL.freeze
    @driver.execute_script('return window.stop')

    @driver.title.clear
    @one_way = @driver.find_element :id, 'oneway'
    @round_trip = @driver.find_element(:id, 'return')
    @stopover = @driver.find_element(:id, 'stopover')
    @departure = @driver.find_element(:id, 'dep_1')
    @arrive = @driver.find_element(:id, 'arr_1')
    @depart_date = @driver.find_element(:id, 'departDate-1')
    @arrival_date = @driver.find_element(:name, 'arrivalDate')
    @select_comfort = @driver.find_element :xpath, "//span[@class='center']"
    @search = @driver.find_element :xpath, "//input[@id='search_now']"
    @adults = @driver.find_element :id, 'ADT'
    @children = @driver.find_element :id, 'CHD'
    @infants = @driver.find_element :id, 'INF'

    @success_title = 'Icelandair-Calendar'
    @error_title = 'Icelandair-Error'
  end

  def dates_clear
    @depart_date.clear
    @arrival_date.clear
  end

  def passengers_count adults, children, infants
    pax_selects = @driver.find_element :class, 'pax_selects'
    @driver.execute_script("arguments[0].setAttribute('style', 'display: block')", pax_selects)
    @adults.clear
    @adults.send_keys adults
    @children.clear
    @children.send_keys children
    @infants.clear
    @infants.send_keys infants
  end

  def establish_date
    @depart_date.send_keys DEPART_DATE
    @arrival_date.send_keys RETURN_DATE
  end

  def just_click_anywhere
    sleep 2
    (@driver.find_element :id, 'header').click
  end

  def set_depart_and_return_points
    @departure.clear
    @departure.send_keys DEPART_CITY
    just_click_anywhere
    @arrive.clear
    @arrive.send_keys RETURN_CITY
    just_click_anywhere
  end

  def flight_type flight_type
    flight_type.click
  end

  def set_comfort_type type
    @driver.execute_script("arguments[0].innerText = '#{type}'", @select_comfort)
  end

end
