# frozen_string_literal: true

# BEGIN
def xnor(operand1, operand2)
  return true if (operand1 == false) & (operand2 == false)

  # rubocop:disable Style/RedundantReturn
  return operand1 & operand2
  # rubocop:enable Style/RedundantReturn
end

def get_same_parity(array)
  return [] if array.empty?

  first_element_status = array.first.even?

  array.filter { |element| xnor first_element_status, element.even? }
end
# END
