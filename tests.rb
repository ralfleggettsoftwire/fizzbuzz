$LOAD_PATH << '.'
require 'fizzbuzz'

##
# Tests an input against an expected output. Runs with all rules by default
def test_output(
  input,
  expected_output,
  options = {
    3 => true,
    5 => true,
    7 => true,
    11 => true,
    13 => true,
    17 => true
  })
  output = FizzBuzz.generate_output(input, options)
  puts "#{output == expected_output}; expected: #{expected_output}; got: #{output}"
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
