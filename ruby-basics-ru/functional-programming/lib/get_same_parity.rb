# frozen_string_literal: true

# BEGIN
def get_same_parity(array)
  return [] if array.empty?

  first_element_status = array.first.even?

  array.filter { |element| first_element_status == element.even? }
end
# END
