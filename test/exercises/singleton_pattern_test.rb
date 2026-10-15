# frozen_string_literal: true

require ARGV.shift
class SingletonPatternTest < Minitest::Test
  # Checks singleton identity.
  def test_singleton_identity
    assert_same Exercises::SingletonPattern::Configuration.instance, Exercises::SingletonPattern::Configuration.instance

    assert_equal 'learning', Exercises::SingletonPattern::Configuration.instance.mode
  end

  # Checks private constructor.
  def test_private_constructor
    assert_raises(NoMethodError) { Exercises::SingletonPattern::Configuration.new }
  end
end
