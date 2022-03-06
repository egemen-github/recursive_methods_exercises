# 0.0 - Define a recursive function that finds the factorial of a number.
def factorial(n)
  if n == 0
    return 1
  else
    n * factorial(n-1)
  end
end

p factorial(3)

# 1.0 - Define a recursive function that returns true if a string is a palindrome and false otherwise.
def palindrome(word)
  if word.length == 1 || word.length == 0
    true
  else
    if word[0] == word[-1]
      palindrome(word[1..-2])
    else
      false
    end
  end
end

p palindrome("aasbbsaa")

# 2.0 - Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".
def function(n)
  if n == 0
    puts "No more bootles of beer on the wall."
  else
    puts "#{n} bottles of beer on the wall"
    function(n-1)
  end
end

function(5)

# 3.0 - Define a recursive function that takes an argument n and returns the fibonacci value of that position. The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.
def fibonacci(n)
  if n == 0
    n
  elsif n == 1
    n
  else
    n = fibonacci(n-1) + fibonacci(n-2)
  end
end

p fibonacci(6)

# 4.0 - Write a method #fibs which takes a number and returns an array containing that many numbers from the fibonacci sequence. Using an epairample input of 8, this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].
def fibs(n)
array = [0, 1]
  (0...n).each do |pair| 
    if pair < 2
      pair
    else
      array << array[pair-1] + array[pair-2]
    end
    array
    end
  array
end

p fibs(8)

# 4.1 - Same with (#4.0) but recursive.
def f_nums(n)
  return 0 if n == 0
  return [0, 1] if n == 1
  array = f_nums(n-1)
  array << array[-2] + array[-1]
end

p f_nums(6)

# 5.0 Define a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].
a = [5,[1, [8, 9]], [3, 4]]
def flattener(a, array=[])
  a.each do |element|
    if element.is_a?(Integer)
      array << element
    elsif element.is_a?(Array)
      flattener(element, array)
    end
   array
  end
  array
end

p flattener(a)

# 6.0 Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
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
