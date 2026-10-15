# frozen_string_literal: true

module Exercises
  # Fix format_order(name, quantity=1, *extras, unit:, **options, &block) to return
  # "name:quantity:unit:extra_count:priority" where priority defaults to "normal".
  class MethodContracts
    # Formats positional, rest, and keyword options, then applies an optional block.
    # @return [String]
    def self.format_order(name, quantity = 1, *extras, unit:, **options, &block)
      text = "#{name}:#{quantity}:#{unit}:#{extras.size}:#{options.fetch(:priority, 'normal')}"
      block ? block.call(text) : text
    end

    # Reports the parameter kinds and names of format_order.
    # @return [Array<Array<Symbol>>]
    def self.parameters = method(:format_order).parameters
  end
end
