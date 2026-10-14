# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class HeredocLayoutAcceptanceTest < Minitest::Test
  # Wrong indentation and unintended interpolation must each fail their own check.
  def test_incorrect_delimiters_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'heredoc-layout')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['<<~TEXT', '<<-TEXT', 'test_squiggly_indentation'],
        ["<<~'TEXT'", "name = 'Ada'\n      <<~TEXT", 'test_quoted_heredoc']
      ]
      cases.each do |original, replacement, check|
        File.write(exercise.solution, reference.sub(original, replacement))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, check
        assert_includes result.output, '1 failures'
      end
    end
  end
end
