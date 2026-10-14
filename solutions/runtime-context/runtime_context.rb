# frozen_string_literal: true

module Exercises
  # A reference implementation for comparison after completing the exercise.
  class RuntimeContext
    # Returns process inputs and runtime metadata with an independent argument array.
    # The greeting is nil when RKOANS_GREETING is absent; file fields are basenames.
    def self.context
      {
        arguments: ARGV.dup,
        greeting: ENV.fetch('RKOANS_GREETING', nil),
        program: File.basename($PROGRAM_NAME),
        file: File.basename(__FILE__),
        encoding: __ENCODING__.name,
        ruby: RUBY_VERSION
      }
    end
  end
end
