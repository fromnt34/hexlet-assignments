# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return if num.negative?

  if num.zero?
    0
  elsif num <= 2
    1
  else
    fibonacci(num - 2) + fibonacci(num - 1)
  end
end
# END
