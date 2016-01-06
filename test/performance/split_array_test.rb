require 'minitest/autorun'
require 'minitest/benchmark'
require 'algorithms/split_array'

#
class SplitArrayTest < MiniTest::Benchmark
  def bench_alg1
    assert_performance_logarithmic do |n|
      Algorithms::SplitArray.alg1(rand(n), Array.new(n).map { rand(n) })
    end
  end
end
