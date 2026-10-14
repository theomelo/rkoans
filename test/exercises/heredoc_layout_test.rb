# frozen_string_literal: true

require ARGV.shift

# Checks exact output bytes without deriving expectations from the learner's code.
class HeredocLayoutTest < Minitest::Test
  # Common indentation is stripped; relative spaces and newlines remain intact.
  def test_squiggly_indentation
    assert_equal "Hello Ada\n  Ruby\n", Exercises::HeredocLayout.render('Ada')
    assert_equal "Hello Bea\n  Ruby\n", Exercises::HeredocLayout.render('Bea')
    assert_equal "Hello \n  Ruby\n", Exercises::HeredocLayout.render('')
  end

  # Quoting the delimiter prevents interpolation without dropping the final newline.
  def test_quoted_heredoc
    assert_equal "Hello \#{name}\n", Exercises::HeredocLayout.literal
  end
end
