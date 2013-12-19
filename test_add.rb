require 'test/unit'
require './numbers'

class TestAdd < Test::Unit::TestCase
  def test_add
    number = 63
    expected = wordify 63
    assert_equal expected, "sixty three"
  end
end
