require 'helper'

class TestKernel < Minitest::Test
  def test_with_retry
    count = 0
    assert_raises(StandardError) do
      with_retry do
        count += 1
        fail
      end
    end
    assert { count == 4 }
  end

  def test_with_retry_limit
    count = 0
    with_retry(limit: 1) {
      count += 1
      fail
    } rescue nil
    assert { count == 2 }
  end

  def test_with_retry_failed
    assert_raises(NotImplementedError) do
      with_retry(failed: NotImplementedError) { fail }
    end
  end
end
