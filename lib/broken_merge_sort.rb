# This is how I was able to sturcture the merge_sort algorithm after spending a whole day for the first time.
# I thought it was woking ok until I test it with bigger arrays.
# I spend another whole day to understand and create a better merge_sort algorithm. See merge_sort.rb :)

module Sorting
    def self.seperate(array, sep_vals = [])
      if array.length == 1
        sep_vals << array
      else
        left = array[0...array.length / 2]
        right = array[array.length / 2..-1]
        seperate(left, sep_vals)
        seperate(right, sep_vals)
      end
    end
  
    def self.first_merge(array, pairs = [])
      if array.one?
        pairs << array.shift
      elsif array.empty?
        pairs
      else
        if array[0][0] < array[1][0]
          pairs << array.shift << array.shift
        else
          pairs << array.delete_at(1) << array.delete_at(0)
        end
        first_merge(array, pairs)
      end
    end
  
    def self.mid_merge(array, pairs=[])
      if array.empty?
        pairs
      elsif array.length == 2
        if array[0][0] < array[1][0]
          pairs << array.delete_at(0)
          pairs << array.shift
        end
      else
        if array[0][0] < array[2][0]
          pairs << array.delete_at(0)
        else
          pairs << array.delete_at(2)
        end
        mid_merge(array, pairs)
      end
    end
  
    def self.last_merge(array, final=[])
      if array.empty?
        final
      elsif array[0].empty?
        final << array[1][0] << array[1][1]
      else
        array.flatten!
        left = array[0...array.length / 2]
        right = array[array.length / 2..-1]
        array = [] << left << right
        if array[0][0] < array[1][0]
          final << array[0].shift
        else
          final << array[1].shift
        end
        last_merge(array, final)
      end
    end
  
    def self.merge_sort(array)
      array1 = seperate(array)      # => [[6], [5], [3], [1], [8], [7], [2], [4]]
      array2 = first_merge(array1)  # => [[5], [6], [1], [3], [7], [8], [2], [4]]
      array3 = mid_merge(array2)    # => [[1], [3], [5], [6], [2], [4], [7], [8]]
      last_merge(array3)            # => [1, 2, 3, 4, 5, 6, 7, 8]
    end
  end
  
  array = [6, 5, 3, 1, 8, 7, 2, 4]
  p Sorting.merge_sort(array)     # => [1, 2, 3, 4, 5, 6, 7, 8]
  