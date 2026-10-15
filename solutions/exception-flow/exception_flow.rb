# frozen_string_literal: true

# The example deliberately rescues and reraises to observe preserved exception state.
# rubocop:disable Lint/UselessRescue

module Exercises
  # Implement trace(fail:): append "work"; if fail, raise and rescue a StandardError and append
  # "rescue"; otherwise append "else".
  class ExceptionFlow
    # Implements trace.
    def self.trace(fail:)
      trail = ['work']
      begin
        raise StandardError, 'failure' if fail
      rescue StandardError
        trail << 'rescue'
      else
        trail << 'else'
      ensure
        trail << 'ensure'
      end
      trail
    end

    # Implements reraises.
    def self.reraises
      raise ArgumentError, 'original'
    rescue ArgumentError
      raise
    end
  end
end

# rubocop:enable Lint/UselessRescue
