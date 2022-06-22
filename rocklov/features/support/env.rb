# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'pry'
require 'allure-cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  Capybara.page.driver.browser.manage.window.maximize
  config.app_host = 'http://rocklov-web:3000'
  config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
  config.results_directory = '/logs'
  config.clean_results_directory = true
end
