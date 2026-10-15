# frozen_string_literal: true

# These examples demonstrate yield rather than explicit block forwarding.
# rubocop:disable Style/ExplicitBlockArgument

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

        @values.each { |value| yield value }
        self
      end

      # Returns the sum of the packet's stored numbers.
      # @return [Integer]
      def total = @values.sum
      # Compares packet totals in ascending order.
      # @return [Integer]
      def <=>(other) = total <=> other.total
      # Returns the packet's total in its printable representation.
      # @return [String]
      def to_s = "Packet(#{total})"
    end

    # Reports each support and ordinary object membership.
    # @return [Array<Boolean>]
    def self.protocol(packet) = [packet.respond_to?(:each), packet.is_a?(Object)]
  end
end

# rubocop:enable Style/ExplicitBlockArgument
