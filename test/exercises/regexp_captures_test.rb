# frozen_string_literal: true

require ARGV.shift
class RegexpCapturesTest < Minitest::Test
  # Checks whole string and captures.
  def test_whole_string_and_captures
    parsed = Exercises::RegexpCaptures.parse('ruby:42')

    assert_equal({ name: 'ruby', id: 42 }, parsed)
    assert_instance_of Integer, parsed.fetch(:id)
    assert_nil Exercises::RegexpCaptures.parse("ruby:42\n")
    assert_nil Exercises::RegexpCaptures.parse('ruby:x')
  end

  # Checks match without global capture change.
  def test_match_without_global_capture_change
    assert_equal ['old', true], Exercises::RegexpCaptures.probe('ruby')
    assert_equal ['old', false], Exercises::RegexpCaptures.probe('rails')
  end
end
