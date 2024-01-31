# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!
# for convenience, but conflict on rubymine idea

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    # parallelize(workers: :number_of_processors, with: :threads)
    parallelize(workers: 1)
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    # is_logged_in? : return true if a test user is logged in
    def logged_in?
      !session[:user_id].nil? # check if the session is not nil
    end

    # login as particular user
    def log_in_as(user)
      session[:user_id] = user.id
    end
  end
end
