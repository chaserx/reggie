require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Registration.new.valid?
  end
end
