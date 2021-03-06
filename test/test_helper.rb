ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'tilt/erb'
require 'launchy'

class Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
