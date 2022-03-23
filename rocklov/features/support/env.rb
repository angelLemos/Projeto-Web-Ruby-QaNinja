# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'pry'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://rocklov-web:3000'
  Capybara.page.driver.browser.manage.window.maximize
end
