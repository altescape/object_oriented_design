def foo(word)
  shite = "farts"
  yield "#{word} and a #{shite}"
end

def bar 
  "fang"
end

foo("mong") { |a| puts a }
