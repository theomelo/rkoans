# frozen_string_literal: true

# The explicit receiver is part of the method-call experiment.
# Explicit getter definitions are compared with attr_reader and attr_accessor.
# rubocop:disable Style/RedundantSelf, Style/TrivialAccessors

module Exercises
  # Wallet has an internal balance reader used when comparing wallets, and a normalizer used within
  # deposit.
  class Visibility
    # Example Wallet for visibility.
    class Wallet
      # Stores the initial values used by this example.
      # @return [void]
      def initialize(balance) = @balance = balance
      # Returns the protected balance used for peer comparisons.
      # @return [Integer]
      def balance = @balance
      # Converts a deposit amount to its nonnegative value.
      # @return [Integer]
      def normalize(value) = value.abs
      # Adds the normalized amount to the balance.
      # @return [Integer]
      def deposit(value) = @balance += self.normalize(value)
      # Compares this balance with another wallet's balance.
      # @return [Integer]
      def compare(other) = balance <=> other.balance
      protected :balance
      private :normalize
    end
  end
end

# rubocop:enable Style/RedundantSelf, Style/TrivialAccessors
