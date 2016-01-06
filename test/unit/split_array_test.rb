require 'minitest/autorun'
require 'algorithms/split_array'

#
class SplitArrayTest < MiniTest::Test
  def test_alg
    assert_equal(4, Algorithms::SplitArray.alg(5, [5, 5, 1, 7, 2, 3, 5]))
  end
end
