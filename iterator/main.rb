def foo(word)
  secondary_word = "things..."
  yield "#{word} and a #{secondary_word}"
end

def bar 
  "fang"
end

foo("Doc") { |a| puts a }
