# frozen_string_literal: true

# The block name is observable through parameter metadata or the explicit forwarding example.
# The exercise makes positional, keyword, and block forwarding visible.
# rubocop:disable Naming/BlockForwarding, Style/ArgumentsForwarding

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
      target(*args, **keywords, &block)
    end
  end
end

# rubocop:enable Naming/BlockForwarding, Style/ArgumentsForwarding
