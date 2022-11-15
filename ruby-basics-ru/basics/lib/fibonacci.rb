# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return num if num <= 1

  first_element = 0
  second_element = 1
  current_element = nil

  (num - 1).times do
    current_element = first_element + second_element
    first_element = second_element
    second_element = current_element
  end

  current_element
end
# END
