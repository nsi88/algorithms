module Algorithms
  # Find the minimal average of any slice containing at least two elements.
  class MinAvgTwoSlices
    # @param [Array] Ex.: [4,2,2,5,1,7,5] or [5,1,5,3,2,4,0]
    # @return [Number] left bound
    # if difference becomes smaller
    # then ++ left border || ++ right border
    # else set left border to right border
    def self.solution(a)
      p = 0
      q = 1
      min = _mean(a, p, q)
      res = 1
      q += 1
      loop do
        mean = _mean(a, p, q)
        puts "p: #{p}, q: #{q}, min: #{min}, res: #{res}, mean: #{mean}"
        if mean <= min
          if q - p > 1
            p += 1
          else
            q += 1
          end
          res = p
          min = mean
        else
          p = q
          q += 1
        end
        break if p >= a.count - 1
      end
      res
    end

    def self.slow(a)
      min = 10000
      res = nil
      for p in 0 .. a.count - 2
        puts
        puts "p: #{p}"
        for q in p + 1 .. a.count - 1
          mean = _mean(a, p, q)
          puts mean.to_s
          if mean < min
            min = mean
            res = p
          end
        end
      end
      res
    end

    private

    def self._mean(a, p, q)
      a[p..q].inject(:+).to_f / (q - p + 1)
    end
  end
end
