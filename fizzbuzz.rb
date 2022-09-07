module FizzBuzz
  ##
  # Generates the output for a single number (i) using a hash of options to
  # choose which rules are applied
  def FizzBuzz.generate_output(i, options)
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

  ##
  # Runs FizzBuzz from 1 up to max, using a hash (options) of selected rules
  # to apply
  def FizzBuzz.fizzbuzz(max = 100, options)
    (1..max).each { |i|
      output = generate_output(i, options)

      # Print output
      puts output
    }
  end
end

