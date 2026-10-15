# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Records messages while transparently forwarding them to a target.
  class AboutProxyObjectProject
    # Forwards unknown public messages and records their names.
    class Proxy
      attr_reader :messages

      # @param target [Object] receiver of forwarded messages
      def initialize(target)
        @target = target
        @messages = []
      end

      # @return [Object] result of the target's public method
      def method_missing(name, ...)
        @target.public_send(name, ...)
      end

      # @return [Boolean] whether a message has been recorded
      def called?(_name)
        false
      end

      # @return [Integer] number of recorded calls to a message
      def number_of_times_called(_name)
        0
      end

      private

      # Keeps introspection consistent with the target's public methods.
      def respond_to_missing?(name, include_private = false)
        super
      end
    end
  end
end
