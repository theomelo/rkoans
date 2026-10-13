# frozen_string_literal: true

module Rkoans
  # Dispatches the command and renders each check run in the terminal.
  class CLI
    # @param [IO] out
    # @param [IO] err
    # @param [String] directory
    def initialize(out: $stdout, err: $stderr, directory: File.join(Dir.home, 'ruby-koans'))
      @out = out
      @err = err
      @exercise = Exercise.new(directory: directory)
      @checker = Checker.new
    end

    # @param [Array<String>] arguments
    # @return [Integer]
    def run(arguments)
      @out.sync = true
      command = arguments.empty? ? 'start' : arguments.first
      return usage_error if arguments.size > 1

      case command
      when 'start'
        start
      when 'check'
        check
      when '--help', '-h'
        help
      else
        usage_error
      end
    rescue Interrupt
      @out.puts "\nStopped. Your edits are preserved."
      130
    rescue SystemCallError => e
      @err.puts e.message
      2
    end

    private

    # Watches until interrupted.
    def start
      @exercise.prepare
      Watcher.new(@exercise.solution).run { show_checks(watching: true) }
    end

    # @return [Integer]
    def check
      unless File.file?(@exercise.solution)
        @err.puts 'No exercise found. Run rkoans start first.'
        return 2
      end
      show_checks(watching: false)
    end

    # @return [Integer]
    def help
      @out.puts 'Usage: rkoans [start|check]'
      @out.puts 'Start watches your exercise for saves. Ctrl-C exits. No command means start.'
      0
    end

    # @param [Boolean] watching
    # @return [Integer]
    def show_checks(watching:)
      @out.print "\e[2J\e[H" if watching && @out.tty?
      @out.puts @exercise.instructions
      @out.puts "\nEdit: #{@exercise.solution}\n\n"
      result = @checker.run(@exercise)
      @out.puts result.output
      @out.puts status_text(result.exit_code)
      @out.puts colorize('Watching for saves · Ctrl-C to exit', 36) if watching
      result.exit_code
    end

    def status_text(exit_code)
      exit_code.zero? ? colorize('PASS', 32) : colorize('FAIL', 31)
    end

    def colorize(text, code)
      return text unless @out.tty? && !ENV.key?('NO_COLOR')

      "\e[#{code}m#{text}\e[0m"
    end

    # @return [Integer]
    def usage_error
      @err.puts 'Usage: rkoans [start|check]'
      2
    end
  end
end
