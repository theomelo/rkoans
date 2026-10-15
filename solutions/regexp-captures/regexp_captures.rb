# frozen_string_literal: true

# The example explicitly observes the regexp capture variable.
# rubocop:disable Style/SpecialGlobalVars

module Exercises
  # Implement parse(text) for an entire string of lowercase name, colon, and decimal digits.
  class RegexpCaptures
    # Implements parse.
    def self.parse(text)
      match = /\A(?<name>[a-z]+):(?<id>\d+)\z/.match(text)
      match && { name: match[:name], id: match[:id].to_i }
    end

    # Implements probe.
    def self.probe(text)
      /old/.match('old')
      matched = /ruby/.match?(text)
      [$~&.to_s, matched]
    end
  end
end

# rubocop:enable Style/SpecialGlobalVars
