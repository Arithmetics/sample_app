require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #helper method for the test. same as the one for the controlller
  #but tests cant use those so this one is made (just with a different name)
  def is_logged_in?
    !session[:user_id].nil?
  end
end
