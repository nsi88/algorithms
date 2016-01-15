module Algorithms
  #     1
  #    1 1
  #   1 2 1
  #  1 3 3 1
  # 1 4 6 4 1
  # or
  # 1
  # 1 1
  # 1 2 1
  # 1 3 3 1
  # 1 4 6 4 1
  class PascalTriangle
    # @param [Number] count rows
    def self.solution(n)
      res = [[1]]
      for i in 1 .. n - 1
        res[i] = []
        for j in 0 .. i
          res[i][j] = (j == 0 ? 0 : res[i-1][j-1]) + (j == i ? 0 : res[i-1][j])
        end
      end
      space = ' ' * res.last[res.last.count / 2].to_s.length
      res.each_with_index do |row, i|
        puts space * (n - i - 1) + row.join(space)
      end
      res
    end

  end
end
