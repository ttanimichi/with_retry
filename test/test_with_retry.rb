require 'helper'

class TestWithRetry < Minitest::Test
  def test_that_it_has_a_version_number
    assert { ::WithRetry::VERSION != nil}
  end
end
