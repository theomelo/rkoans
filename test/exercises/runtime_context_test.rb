# frozen_string_literal: true

require ARGV.shift

# Checks runtime inputs and metadata inside the isolated check process.
class RuntimeContextTest < Minitest::Test
  # Saves the ambient globals and supplies deterministic inputs for each check.
  def setup
    @arguments = ARGV.dup
    @greeting = ENV.fetch('RKOANS_GREETING', nil)
    ARGV.replace(%w[alpha beta])
    ENV['RKOANS_GREETING'] = 'hello'
  end

  # Restores the original arguments and greeting even when an assertion fails.
  def teardown
    ARGV.replace(@arguments)
    @greeting ? ENV['RKOANS_GREETING'] = @greeting : ENV.delete('RKOANS_GREETING')
  end

  # Reading and later changing the returned arguments must leave ARGV intact.
  def test_runtime_globals
    context = Exercises::RuntimeContext.context

    assert_equal %w[alpha beta], context[:arguments]
    assert_equal 'hello', context[:greeting]
    assert_equal %w[alpha beta], ARGV
    context[:arguments] << 'changed'

    assert_equal %w[alpha beta], ARGV
  end

  # The required file and entry point differ; runtime constants describe this Ruby.
  def test_runtime_constants
    context = Exercises::RuntimeContext.context

    assert_equal 'runtime_context.rb', context[:file]
    assert_equal 'runtime_context_test.rb', context[:program]
    assert_equal 'UTF-8', context[:encoding]
    assert_equal RUBY_VERSION, context[:ruby]
  end

  # Empty arguments and a missing environment key have ordinary Ruby defaults.
  def test_empty_arguments_and_missing_greeting
    ARGV.clear
    ENV.delete('RKOANS_GREETING')
    context = Exercises::RuntimeContext.context

    assert_empty context[:arguments]
    assert_nil context[:greeting]
  end
end
