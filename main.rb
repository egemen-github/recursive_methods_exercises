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

p palindrome("abc")
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

# 4.0 - Write a method #fibs which takes a number and returns an array containing that many numbers from the fibonacci sequence. Using an example input of 8, this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].
def fibs(n)
array = [0, 1]
  (0...n).each do |x| 
    if x < 2
      x
    else
      array << array[x-1] + array[x-2]
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

