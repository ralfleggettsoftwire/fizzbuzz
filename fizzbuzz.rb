def generate_output(i)
  output = Array.new

  # Multiple-of tests
  if i % 3 == 0
    output << 'Fizz'
  end
  if i % 5 == 0
    output << 'Buzz'
  end
  if i % 7 == 0
    output << 'Bang'
  end
  if i % 11 == 0
    output = ['Bong']
  end
  if i % 13 == 0
    index = output.index { |elem| elem[0] == 'B' }
    index = index ? index : -1
    output.insert(index, 'Fezz')
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

def test_output(input, expectedOutput)
  output = generate_output(input)
  puts "#{output == expectedOutput}; expected: #{expectedOutput}; got: #{output}"
end

def fizzbuzz(max = 100)
  (1..max).each { |i|
    output = generate_output(i)

    # Print output
    puts output
  }
end

# Tests:
puts test_output(1, '1')
puts test_output(3 * 7, 'FizzBang')
puts test_output(3 * 11, 'Bong')
puts test_output(5 * 13, 'FezzBuzz')
puts test_output(3 * 5 * 13, 'FizzFezzBuzz')
puts test_output(3 * 13, 'FizzFezz')
puts test_output(11 * 13, 'FezzBong')
puts test_output(3 * 5 * 17, 'BuzzFizz')
puts test_output(11 * 13 * 17, 'BongFezz')

# Program begins here
# -----------------------------------------------------------------------------
# Loop until we get a positive number
max = nil
loop do
  print 'FizzBuzz up to which number?: '
  max = gets.chomp
  break if max.match(/^\d+$/)
  puts 'Please enter a positive number'
end

fizzbuzz(max.to_i)