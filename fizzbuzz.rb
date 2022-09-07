def process_argv(argv)
  options = {
    3 => false,
    5 => false,
    7 => false,
    11 => false,
    13 => false,
    17 => false
  }

  argv.each do |arg|
    if arg.match(/^\d+$/) and options.has_key? arg.to_i
      options[arg.to_i] = true
    else
      puts "Unknown argument supplied: #{arg}. Supports #{options.keys}"
      exit
    end
  end

  return options
end

def generate_output(i, options)
  output = Array.new

  # Multiple-of tests
  if options[3] and i % 3 == 0
    output << 'Fizz'
  end
  if options[5] and i % 5 == 0
    output << 'Buzz'
  end
  if options[7] and i % 7 == 0
    output << 'Bang'
  end
  if options[11] and i % 11 == 0
    output = ['Bong']
  end
  if options[13] and i % 13 == 0
    index = output.index { |elem| elem[0] == 'B' }
    index = index ? index : -1
    output.insert(index, 'Fezz')
  end
  if options[17] and i % 17 == 0
    output.reverse!
  end

  # Check if output empty, if so output is i
  unless output.length > 0
    return "#{i}"
  end

  # Otherwise, concat the array and return
  return output.join
end

def test_output(input, expected_output)
  options = {
    3 => true,
    5 => true,
    7 => true,
    11 => true,
    13 => true,
    17 => true
  }
  output = generate_output(input, options)
  puts "#{output == expected_output}; expected: #{expected_output}; got: #{output}"
end

def fizzbuzz(max = 100, options)
  (1..max).each { |i|
    output = generate_output(i, options)

    # Print output
    puts output
  }
end

def get_max
  # Loop until we get a positive number
  max = nil
  loop do
    print 'FizzBuzz up to which number?: '
    max = STDIN.gets.chomp
    break if max.match(/^\d+$/)
    puts 'Please enter a positive number'
  end
  return max.to_i
end

# Tests:
# puts test_output(1, '1')
# puts test_output(3 * 7, 'FizzBang')
# puts test_output(3 * 11, 'Bong')
# puts test_output(5 * 13, 'FezzBuzz')
# puts test_output(3 * 5 * 13, 'FizzFezzBuzz')
# puts test_output(3 * 13, 'FizzFezz')
# puts test_output(11 * 13, 'FezzBong')
# puts test_output(3 * 5 * 17, 'BuzzFizz')
# puts test_output(11 * 13 * 17, 'BongFezz')

# Program begins here
# -----------------------------------------------------------------------------
# Get command line arguments
options = process_argv(ARGV)

if options
  max = get_max
  fizzbuzz(max, options)
end

