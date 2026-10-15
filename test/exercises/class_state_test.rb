# frozen_string_literal: true

# The examples contrast block forms and their behavior.
# rubocop:disable Style/BlockDelimiters

require ARGV.shift
class ClassStateTest < Minitest::Test
  # Checks independent class instance state.
  def test_independent_class_instance_state
    Exercises::ClassState::Parent.reset
    Exercises::ClassState::Child.reset
    2.times {
      Exercises::ClassState::Parent.increment
    }

    Exercises::ClassState::Child.increment

    assert_equal 2, Exercises::ClassState::Parent.count
    assert_equal 1, Exercises::ClassState::Child.count
  end

  # Checks class inheritance and singleton.
  def test_class_inheritance_and_singleton
    assert_equal 'parent-child', Exercises::ClassState::Child.label
    assert_equal Exercises::ClassState::Parent.singleton_class, Exercises::ClassState.singleton_owner
  end
end

# rubocop:enable Style/BlockDelimiters
