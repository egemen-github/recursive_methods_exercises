require 'benchmark'

# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.

def split(array, sep_vals = [])
  if array.length == 1
  sep_vals << array
  else
  left = array[0...array.length / 2]
  right = array[array.length / 2..-1]
  split(left, sep_vals)
  split(right, sep_vals)
  end
end

def merge(arr, sorted=[])
  left, right = arr[0], arr[1]
  if arr.one?
    arr[0]
  elsif left.empty?
    merge([sorted + right] + arr[2..-1])
  elsif right.empty?
    merge([sorted + left] + arr[2..-1])
  else
    left.first < right.first ? (sorted << left.shift) : (sorted << right.shift)
    merge(arr, sorted)
  end
end

def merge_sort(array)
  values = split(array)
  merge(values)
end

p array = Array.new(5) { rand(0..8) }

puts Benchmark.measure { p merge_sort(array) }
