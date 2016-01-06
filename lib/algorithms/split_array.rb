module Algorithms
  # An integer X and a non-empty zero-indexed array A consist of N integers.
  # We are interested in two parts, such that the number of elements equal to X
  # in the first part is same as the number of elements different from X
  # in the other part. More formally, we are looking for an index K such that:
  # 0 <= L <= N, and the number of elements equal to X on A[0..K-1] is the same
  # as number of elements different from X in A[K..N-1]. (For K = 0, A[0..K-1]
  # does not contain any elemnets.)
  # For example, given integer X = 5 and arraty A such that:
  # A[0] = 5 A[1] = 5 A[2] = 1 A[3] = 7 A[4] = 2 A[5] = 3 A[6] = 5 K equals 4,
  # because: two of elements of A[0..3] are equal to X, namely A[0] = A[1] = X,
  # and two of elements of A[4..6] are different from X, namely A[4] and A[5].
  # Write a function that: Given as integer X and a non-empty zero indexed array
  # A consisting of N integer, returns the value of index K satisfying the above
  # conditions. If more than one index K satisfies the above conditions, your
  # function may return any of them. If there is no such index, function should
  # return -1.
  # For example, given integer X and array A as above, the function should
  # return 4, as explaindex above. Assume that: N is as integer within the range
  # [1..100,000] X is an integer within the range [0..100,000] Complexity:
  # expected worst-case time complexity is O(N) expected worst-case space
  # complexity is O(1), beyond input storahe (not counting the storage
  # required for input arguments). Elements of input array can be modified.
  class SplitArray
    # Brute force
    def self.alg1(x, a)
      a.each_index do |i|
        return i if split_diff(x, a, i) == 0
      end
      -1
    end

    # 1. Let k eq index of the middle array element
    # 2. Return k if difference == 0
    # 3. Return -1 if k == 0 || k == a.count - 1
    # 4. Change k by (difference / 2.0).ceil
    # 5. Go to 2
    def self.alg2(x, a)
      k = a.count / 2
      loop do
        diff = split_diff(x, a, k)
        puts "k: #{k}, diff: #{diff}"
        return k if diff == 0
        return -1 if k == 0 || k == a.count - 1
        k -= (diff / 2.0).round
      end
    end

    class << self
      alias_method :alg, :alg2
    end

    # Difference of left and right parts counts
    def self.split_diff(x, a, k)
      a[0...k].count(x) - a[k...a.count].count { |e| e != x }
    end
  end
end
