# frozen_string_literal: true

require 'io/console'
require 'io/wait'

module Rkoans
  # Reads immediate keys while reserving Enter confirmation for next and quit.
  class Keyboard
    def initialize(input:)
      @input = input
      @pending = nil
    end

    def with_terminal(&block)
      if @input&.tty?
        @input.raw(intr: true, &block)
      else
        block.call
      end
    end

    def read(interval)
      unless @input
        sleep interval
        return
      end
      return unless @input.wait_readable(interval)

      key = @input.read_nonblock(1, exception: false)
      @input = nil unless key
      decode(key) if key.is_a?(String)
    end

    private

    def decode(key)
      case key
      when "\n", "\r"
        command = @pending
        @pending = nil
        command
      when 'n', 'q'
        @pending = key
        nil
      else
        @pending = nil
        key unless ["\e", "\b", "\u007f", ' '].include?(key)
      end
    end
  end
end
