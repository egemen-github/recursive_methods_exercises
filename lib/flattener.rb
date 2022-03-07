# Define a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

def flattener(a, array=[])
  a.each do |element|
    if element.is_a?(Integer)
      array << element
    elsif element.is_a?(Array)
      flattener(element, array)
    end
  end
  array
end

a = [5,[1, [8, 9]], [3, 4]]

p flattener(a)
