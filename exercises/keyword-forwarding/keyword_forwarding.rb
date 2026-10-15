# frozen_string_literal: true

# The example deliberately contrasts received arguments with values actually used.
# The block name is observable through parameter metadata or the explicit forwarding example.
# The exercise makes positional, keyword, and block forwarding visible.
# rubocop:disable Lint/UnusedMethodArgument, Naming/BlockForwarding, Style/ArgumentsForwarding

module Exercises
  # Fix forward to preserve positional arguments, keyword arguments, and the block when calling
  # target.
  class KeywordForwarding
    # Renders one positional payload with an optional block and suffix.
    # @return [String]
    def self.target(payload, suffix: '?')
      rendered = block_given? ? yield(payload) : payload.to_s
      rendered + suffix
    end

    # Forwards positional arguments, keywords, and the block to target.
    # @return [String]
    def self.forward(*args, **keywords, &block)
      target(*args, &block)
    end
  end
end

# rubocop:enable Lint/UnusedMethodArgument, Naming/BlockForwarding, Style/ArgumentsForwarding
