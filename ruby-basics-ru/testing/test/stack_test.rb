# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_initialize
    stack = Stack.new

    assert_instance_of Stack, stack
  end

  def test_to_a
    stack = Stack.new ['a', 1]

    assert_equal ['a', 1], stack.to_a
  end

  def test_clear!
    stack = Stack.new ['a', 1]
    stack.clear!

    assert_empty stack.to_a
  end

  def setup
    @stack = Stack.new
  end

  def after_teardown
    @stack.clear!
  end

  def test_push!
    @stack.push! 'a'

    assert_includes @stack.to_a, 'a'
  end

  def test_pop!
    @stack.push! 'a'
    @stack.push! 1
    @stack.pop!
    @stack.pop!

    assert_empty @stack.to_a
  end

  def test_size
    @stack.push! 'a'
    @stack.push! 1

    assert_equal @stack.size, 2
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
