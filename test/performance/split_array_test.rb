require 'minitest/autorun'
require 'minitest/benchmark'
require 'algorithms/split_array'

#
class SplitArrayTest < MiniTest::Benchmark
  def bench_alg
    assert_performance_logarithmic do |n|
      Algorithms::SplitArray.alg(rand(n), Array.new(n).map { rand(n) })
    end
  end
end
