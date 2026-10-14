# frozen_string_literal: true

module Exercises
  # Reads the process inputs and identifies the running Ruby files and version.
  class RuntimeContext
    # Return the context hash described in the brief without consuming arguments.
    def self.context
      { arguments: [], greeting: '', program: '', file: '', encoding: '', ruby: '' }
    end
  end
end
