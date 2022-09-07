$LOAD_PATH << '.'
require 'fizzbuzz'

##
# Processes ARGV (passed as an argument) to identify which rules the user
# wishes to apply. If an invalid argument is passed, the user is notified
# and the program exits
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

##
# Prompts the user to specify a positive number to run FizzBuzz up to. Loops
# until a valid number is supplied
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

# Program begins here
# -----------------------------------------------------------------------------
# Get command line arguments
options = process_argv(ARGV)

if options
  # Get the number to FizzBuzz up to
  max = get_max
  FizzBuzz.fizzbuzz(max, options)
end