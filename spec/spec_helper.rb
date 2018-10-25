ENV['RACK_ENV'] = 'test'
require 'capybara'
require 'capybara/rspec'
require 'pry'
require 'rspec'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = App

RSpec.configure do |config|
  config.before(:each) do
    con = PG.connect dbname: "daily_diary_test"
    con.exec "TRUNCATE entries;"
  end
end
