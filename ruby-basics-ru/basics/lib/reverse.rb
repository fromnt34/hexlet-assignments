# frozen_string_literal: true

# BEGIN
def reverse(string_)
  result = ''

  string_.each_char { |char| result = char + result }

  result
end
# END
