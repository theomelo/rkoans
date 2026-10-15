# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

# Explicit open/ensure is the resource-cleanup pattern taught by this lesson.
# rubocop:disable Style/FileOpen

module Exercises
  # Shares file acquisition and cleanup around different operations.
  class AboutSandwichCode
    # @return [Integer] number of lines, including a final line without a newline
    def self.count_lines(path)
      file = File.open(path)
      count = 0
      count += 1 while file.gets
      count
    ensure
      file&.close
    end

    # @return [String, nil] first line containing e, preserving its line ending
    def self.find_line(path)
      file = File.open(path)
      while (line = file.gets)
        return line if line.include?('e')
      end
      nil
    ensure
      file&.close
    end

    # Yield an open file and close it on normal return, early exit or exception.
    # @return [Object] the block's result
    def self.file_sandwich(path)
      file = File.open(path)
      yield file
    ensure
      file&.close
    end

    # @return [Integer] number of lines using the shared sandwich
    def self.count_lines2(path)
      file_sandwich(path) { |file| file.each_line.count }
    end

    # @return [String, nil] first matching line using the shared sandwich
    def self.find_line2(path)
      file_sandwich(path) { |file| file.find { |line| line.include?('e') } }
    end

    # @return [Integer] number of lines using File.open's built-in sandwich
    def self.count_lines3(path)
      File.open(path) { |file| file.each_line.count }
    end
  end
end

# rubocop:enable Style/FileOpen
