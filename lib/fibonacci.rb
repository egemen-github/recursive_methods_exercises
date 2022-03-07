# Define a recursive function that takes an argument n and returns the fibonacci value of that position.
# The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.
def fibonacci(n)
  if n == 0
    n
  elsif n == 1
    n
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end

p fibonacci(6)

# Write a method #fibs which takes a number and returns an array containing that many numbers from the fibonacci sequence.
# Using an epairample input of 8, this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].
def fibs(n)
array = [0, 1]
  (0...n).each do |pair| 
    if pair < 2
      pair
    else
      array << array[pair - 1] + array[pair - 2]
    end
  end
  array
end

p fibs(8)

# Same with above but more recursive.
def f_nums(n)
  return 0 if n == 0
  return [0, 1] if n == 1
  array = f_nums(n - 1)
  array << array[-2] + array[-1]
end

p f_nums(7)
