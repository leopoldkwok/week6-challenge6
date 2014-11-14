ENV['CODECLIMATE_REPO_TOKEN']='1c82002142de0b702ec0795ad7462fb19bb95f48b0f4dab5507876e1d1086ca9'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


ENV["RACK_ENV"] = 'test'

require_relative './../app/server.rb'
require 'database_cleaner'
require 'capybara/rspec'

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
