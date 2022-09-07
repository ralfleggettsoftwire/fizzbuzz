def generateOutput(i)
  output = Array.new

  # Multiple-of tests
  if i % 3 == 0
    output << "Fizz"
  end
  if i % 5 == 0
    output << "Buzz"
  end
  if i % 7 == 0
    output << "Bang"
  end
  if i % 11 == 0
    output = ["Bong"]
  end
  if i % 13 == 0
    index = output.index { |elem| elem[0] == "B" }
    index = index ? index : -1
    output.insert(index, "Fezz")
  end
  if i % 17 == 0
    output.reverse!
  end

  # Check if output empty, if so output is i
  unless output.length > 0
    return "#{i}"
  end

  # Otherwise, concat the array and return
  return output.join
end

def testOutput(input, expectedOutput)
  output = generateOutput(input)
  puts "#{output == expectedOutput}; expected: #{expectedOutput}; got: #{output}"
end

def fizzbuzz(max = 100)
  (1..max).each { |i|
    output = generateOutput(i)

    # Print output
    puts output
  }
end

# Tests:
puts testOutput(1, "1")
puts testOutput(3 * 7, "FizzBang")
puts testOutput(3 * 11, "Bong")
puts testOutput(5 * 13, "FezzBuzz")
puts testOutput(3 * 5 * 13, "FizzFezzBuzz")
puts testOutput(3 * 13, "FizzFezz")
puts testOutput(11 * 13, "FezzBong")
puts testOutput(3 * 5 * 17, "BuzzFizz")
puts testOutput(11 * 13 * 17, "BongFezz")