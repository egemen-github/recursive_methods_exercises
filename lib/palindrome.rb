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
