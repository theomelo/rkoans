# frozen_string_literal: true

module Rkoans
  # Dispatches the command and renders each check run in the terminal.
  class CLI
    # @param [IO] out
    # @param [IO] err
    # @param [String] directory
    # @param catalog [Catalog, nil] ordered exercises used by this component
    def initialize(out: $stdout, err: $stderr, input: $stdin, directory: File.join(Dir.home, 'ruby-koans'),
                   catalog: nil)
      @catalog = catalog
      @out = out
      @err = err
      @directory = directory
      @input = input
      @session = nil
    end

    # @param [Array<String>] arguments
    # @return [Integer]
    def run(arguments)
      @out.sync = true
      command = arguments.empty? ? 'start' : arguments.first
      return usage_error if arguments.size > 2 || (arguments.size == 2 && command != 'start')

      dispatch(command, arguments[1])
    rescue Interrupt
      @out.puts "\nStopped. Your edits are preserved."
      130
    rescue Error, SystemCallError => e
      @err.puts e.message
      2
    end

    private

    # Loads installation data inside run's setup-error handler, only when needed.
    # @return [Catalog]
    def catalog
      @catalog ||= Catalog.new
    end

    # Creates the interactive coordinator after the catalog has been validated.
    # @return [Session]
    def session
      @session ||= Session.new(directory: @directory, out: @out, input: @input, catalog: catalog)
    end

    def dispatch(command, id)
      case command
      when 'start'
        session.start(id)
      when 'check'
        session.check
      when 'list'
        @out.puts catalog.ids
        0
      when '--help', '-h'
        help
      else
        usage_error
      end
    end

    # @return [Integer]
    def help
      @out.puts 'Usage: rkoans [start [EXERCISE]|check|list]'
      @out.puts 'Start watches your exercise for saves. Ctrl-C exits. No command means start.'
      0
    end

    # @return [Integer]
    def usage_error
      @err.puts 'Usage: rkoans [start [EXERCISE]|check|list]'
      2
    end
  end
end
