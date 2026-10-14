# frozen_string_literal: true

module Exercises
  # A reference implementation for comparison after completing the exercise.
  class HeredocLayout
    # Strips common source indentation and interpolates the supplied name.
    # @param name [String]
    # @return [String]
    def self.render(name)
      <<~TEXT
        Hello #{name}
          Ruby
      TEXT
    end

    # Returns literal interpolation syntax followed by a newline.
    # @return [String]
    def self.literal
      <<~'TEXT'
        Hello #{name}
      TEXT
    end
  end
end
