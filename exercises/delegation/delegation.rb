# frozen_string_literal: true

require 'forwardable'
module Exercises
  # Mailbox wraps a supplied array.
  class Delegation
    # Example Mailbox for delegation.
    class Mailbox
      extend Forwardable

      # Stores the initial values used by this example.
      # @return [void]
      def initialize(items)
        @items = items
        @archive = []
      end
      def_delegators :@archive, :push, :size
    end
  end
end
