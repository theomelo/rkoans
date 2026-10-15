# frozen_string_literal: true

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
      end
      trail
    end

    # Implements reraises.
    def self.reraises
      raise ArgumentError, 'original'
    rescue ArgumentError
      nil
    end
  end
end
