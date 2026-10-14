# frozen_string_literal: true

module Exercises
  # Produces multiline strings while preserving deliberate relative indentation.
  class HeredocLayout
    # Fix the delimiter so common indentation disappears but Ruby stays indented.
    # @param name [String] name interpolated into the greeting
    # @return [String]
    def self.render(name)
      <<-TEXT
        Hello #{name}
          Ruby
      TEXT
    end

    # Quote the delimiter so the interpolation marker remains literal text.
    # @return [String]
    def self.literal
      name = 'Ada'
      <<~TEXT
        Hello #{name}
      TEXT
    end
  end
end
