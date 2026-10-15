# frozen_string_literal: true

require ARGV.shift
class DynamicMethodsTest < Minitest::Test
  # Checks defined reader closures.
  def test_defined_reader_closures
    klass = Exercises::DynamicMethods.readers(%i[left right])
    obj = klass.new

    obj.instance_variable_set(:@left, 10)
    obj.instance_variable_set(:@right, 20)

    assert_equal [10, 20], [obj.left, obj.right]
  end

  # Checks eval binding and reflection.
  def test_eval_binding_and_reflection
    assert_equal 8, Exercises::DynamicMethods.evaluate(4)
    obj = Object.new

    obj.instance_variable_set(:@token, :ruby)

    assert_equal :ruby, Exercises::DynamicMethods.instance_value(obj, :token)
    klass = Exercises::DynamicMethods.readers([])

    assert_equal klass, Exercises::DynamicMethods.class_value(klass)
  end
end
