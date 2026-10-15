# frozen_string_literal: true

# The example deliberately contrasts received arguments with values actually used.
# rubocop:disable Lint/UnusedMethodArgument

module Exercises
  # Fix format_order(name, quantity=1, *extras, unit:, **options, &block) to return
  # "name:quantity:unit:extra_count:priority" where priority defaults to "normal".
  class MethodContracts
    # Formats positional, rest, and keyword options, then applies an optional block.
    # @return [String]
    def self.format_order(name, quantity = 1, *extras, unit:, **options, &block)
      "#{name}:#{quantity}:#{unit}:#{extras.size}:normal"
    end

    # Reports the parameter kinds and names of format_order.
    # @return [Array<Array<Symbol>>]
    def self.parameters = []
  end
end

# rubocop:enable Lint/UnusedMethodArgument
