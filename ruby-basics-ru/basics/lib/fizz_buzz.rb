# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop

  result = ''

  start.upto stop do |i|
    is_fizz = (i % 3).zero?
    is_buzz = (i % 5).zero?

    result += if is_fizz & is_buzz
                'FizzBuzz'
              elsif is_fizz
                'Fizz'
              elsif is_buzz
                'Buzz'
              else
                i.to_s
              end

    result += ' ' if i != stop
  end

  result
end
# END
