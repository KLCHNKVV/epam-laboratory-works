require_relative 'spec/spec_helper'

describe 'icelandair-selenium-testing' do
  before '@test_case_1' do
    initalize_selenium
  end

  after '@test_case_1' do
    sleep 10
    @driver.quit
  end

  it 'test case #1', :test_case_1 => true do
    set_depart_and_return_points
    establish_date
    passengers_count 2, 0, 0
    set_comfort_type COMFORT_CLASSES[:economy]
    @search.submit
  end

  it 'test case #2', :test_case_2 => true do
    set_depart_and_return_points
    just_click_anywhere
    establish_date
    passengers_count 2, 0, 1
    set_comfort_type COMFORT_CLASSES[:comfort]
    @search.submit
  end

  it 'test case #3', :test_case_3 => true do
    dates_clear
    flight_type @one_way
    set_depart_and_return_points
    @depart_date.send_keys DEPART_DATE
    passengers_count 2, 0, 1
    set_comfort_type COMFORT_CLASSES[:saga]
    @search.submit
  end

  it 'test case #4', :test_case_4 => true do
    @depart_date.clear
    flight_type @round_trip
    set_depart_and_return_points
    establish_date
    passengers_count 2, 0, 1
    @driver.execute_script("arguments[0].innerText = '#{COMFORT_CLASSES[1]}'", @select_comfort)
    @search.submit
  end

  it 'test case #5', :test_case_5 => true do
    flight_type @one_way
    @depart_date.clear
    set_depart_and_return_points
    @depart_date.send_keys DEPART_DATE
    passengers_count 1, 1, 0
    set_comfort_type COMFORT_CLASSES[:comfort]
    @search.submit
  end

  it 'test case #6', :test_case_6 => true do
    flight_type @stopover
    sleep 1
    @depart_date.clear
    @departure.clear
    @departure.send_keys 'Chicago'
    just_click_anywhere
    @arrive.clear
    @arrive.send_keys 'Reykjavik (KEF) Iceland'
    just_click_anywhere
    @driver.find_element(:id, 'dep_2').send_keys 'Reykjavik (KEF) Iceland'
    just_click_anywhere
    @driver.find_element(:id, 'arr_2').send_keys 'Chicago (CHI) United States'
    just_click_anywhere
    @depart_date.send_keys DEPART_DATE
    @driver.execute_script("return arguments[0].value='#{(Time.now + 14*24*60*60).strftime('%m/%d/%Y')}'", (@driver.find_element :id, 'departDate-2'))
    passengers_count 3, 0, 0
    set_comfort_type COMFORT_CLASSES[:comfort]
    @search.submit
  end

  it 'test case #7', :test_case_7 => true do
    (@driver.find_element :link_text, 'Hotels').click
    (@driver.find_element :id, 'ss').send_keys 'Tokyo, Tokyo Prefecture, Japan', :tab, :tab
    (@driver.find_element :name, 'checkin_month').send_keys Time.now.strftime('%m')
    (@driver.find_element :name, 'checkin_monthday').send_keys (Time.now + 4*24*60*60).strftime('%d')
    (@driver.find_element :name, 'checkin_year').send_keys (Time.now + 4*24*60*60).strftime('%Y'), :tab
    (@driver.find_element :id, 'no_rooms').send_keys 2
    (@driver.find_element :id, 'group_adults').send_keys 3
    (@driver.find_element :class, 'sb-searchbox').submit
  end

  it 'test case #8', :test_case_8 => true do
    flight_type @one_way
    @depart_date.clear
    set_depart_and_return_points
    @depart_date.send_keys DEPART_DATE
    passengers_count 2, 0, 0
    set_comfort_type COMFORT_CLASSES[:saga]
    @search.submit
  end

  it 'test case #9', :test_case_9 => true do
    flight_type @one_way
    @depart_date.clear
    set_depart_and_return_points
    @depart_date.send_keys DEPART_DATE
    passengers_count 1, 0, 2
    set_comfort_type COMFORT_CLASSES[:saga]
    @search.submit
  end

  it 'test case #10', :test_case_10 => true do
    (@driver.find_element :link_text, 'Cars').click
    (@driver.find_element :id, 'puSearchInput').send_keys 'Boston - Logan Intl, US'
    (@driver.find_element :id, 'pu_date').clear
    (@driver.find_element :id, 'pu_date').send_keys Time.now.strftime('%m/%d/%Y')
    (@driver.find_element :id, 'do_date').clear
    (@driver.find_element :id, 'do_date').send_keys (Time.now + 2*24*60*60).strftime('%m/%d/%Y')
    (@driver.find_element :id, 'formsubmit').submit
  end

end
