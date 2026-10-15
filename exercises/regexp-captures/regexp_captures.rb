# frozen_string_literal: true

# The starter compares boolean coercion of match with match? while observing capture changes.
# The example explicitly observes the regexp capture variable.
# rubocop:disable Style/DoubleNegation, Style/SpecialGlobalVars

module Exercises
  # Implement parse(text) for an entire string of lowercase name, colon, and decimal digits.
  class RegexpCaptures
    # Implements parse.
    def self.parse(text)
      match = /^(?<name>[a-z]+):(?<id>\d+)$/.match(text)
      match && { name: match[:name], id: match[:id] }
    end

    # Implements probe.
    def self.probe(text)
      /old/.match('old')
      matched = !!/ruby/.match(text)
      [$~&.to_s, matched]
    end
  end
end

# rubocop:enable Style/DoubleNegation, Style/SpecialGlobalVars
