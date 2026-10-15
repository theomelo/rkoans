# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

require 'tempfile'

class AboutSandwichCodeTest < Minitest::Test
  # Count and search the original example through each version of the operation.
  def test_counting_and_finding_lines
    Tempfile.create('rkoans-lines') do |file|
      file.write("this\nis\na\ntest\n")
      file.flush
      subject = Exercises::AboutSandwichCode

      assert_equal 4, subject.count_lines(file.path)
      assert_equal 4, subject.count_lines2(file.path)
      assert_equal 4, subject.count_lines3(file.path)
      assert_equal "test\n", subject.find_line(file.path)
      assert_equal "test\n", subject.find_line2(file.path)
    end
  end

  # Empty files, absent matches and a final unterminated line retain their meaning.
  def test_empty_and_unterminated_files
    Tempfile.create('rkoans-lines') do |file|
      subject = Exercises::AboutSandwichCode

      assert_equal 0, subject.count_lines2(file.path)
      assert_nil subject.find_line2(file.path)
      file.write('ruby')
      file.flush

      assert_equal 1, subject.count_lines3(file.path)
      assert_nil subject.find_line2(file.path)
    end
  end

  # The resource closes and the result survives both successful and failing blocks.
  def test_file_sandwich_closes_on_success_and_exception
    Tempfile.create('rkoans-cleanup') do |file|
      captured = nil
      result = Exercises::AboutSandwichCode.file_sandwich(file.path) do |opened|
        captured = opened
        :result
      end

      assert_equal :result, result
      assert_predicate captured, :closed?
      error = assert_raises(RuntimeError) do
        Exercises::AboutSandwichCode.file_sandwich(file.path) do |opened|
          captured = opened
          raise 'operation failed'
        end
      end

      assert_equal 'operation failed', error.message
      assert_predicate captured, :closed?
    ensure
      captured&.close
    end
  end

  # A block's early break must also release the open file.
  def test_file_sandwich_closes_on_early_exit
    Tempfile.create('rkoans-cleanup') do |file|
      captured = nil
      result = Exercises::AboutSandwichCode.file_sandwich(file.path) do |opened|
        captured = opened
        break :early
      end

      assert_equal :early, result
      assert_predicate captured, :closed?
    ensure
      captured&.close
    end
  end
end
