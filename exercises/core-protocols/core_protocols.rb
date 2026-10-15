# frozen_string_literal: true

# The example deliberately contrasts received arguments with values actually used.
# rubocop:disable Lint/UnusedMethodArgument

module Exercises
  # Packet wraps numbers.
  class CoreProtocols
    # Example Packet for core protocols.
    class Packet
      include Enumerable
      include Comparable

      # Stores the initial values used by this example.
      # @return [void]
      def initialize(values) = @values = values.dup

      # Yields all stored numbers, or returns an Enumerator when no block is given.
      # @return [Enumerator, Object]
      def each
        return enum_for(:each) unless block_given?

        yield @values.first unless @values.empty?
      end

      # Returns the sum of the packet's stored numbers.
      # @return [Integer]
      def total = @values.sum
      # Compares packet totals in ascending order.
      # @return [Integer]
      def <=>(other) = other.total <=> total
      # Returns the packet's total in its printable representation.
      # @return [String]
      def to_s = 'Packet'
    end

    # Reports each support and ordinary object membership.
    # @return [Array<Boolean>]
    def self.protocol(packet) = [false, false]
  end
end

# rubocop:enable Lint/UnusedMethodArgument
