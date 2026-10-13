# frozen_string_literal: true

module Rkoans
  # Renders check output, the completed screen, and the session footer.
  class TerminalView
    HELP = <<~TEXT
      Keyboard help

      l          List exercises immediately.
      s          Show the current exercise immediately.
      h          Show an exercise hint immediately (unfinished current exercise only).
      ?          Show this help immediately.
      n + Enter  Move to the next exercise after the current checks pass.
      q + Enter  Quit and preserve your edits.
      Ctrl-C     Quit and preserve your edits.

      Saving your exercise file reruns its checks automatically.
    TEXT

    def initialize(out:)
      @out = out
    end

    def render(exercise:, result:, completed:, watching:, message: nil)
      clear if watching
      @out.puts "Output\n\n"
      if watching && result.exit_code.zero?
        show_completed(exercise)
      else
        show_checks(exercise, result)
      end
      @out.puts "\n#{message}" if message
      footer(exercise, completed, result.exit_code.zero?) if watching
    end

    def show_message(message, exercise:, completed:, passed:, mode: :current)
      clear
      @out.puts "Output\n\n#{message}"
      footer(exercise, completed, passed, listing: mode == :list) unless mode == :quit
    end

    def show_list(exercise:, completed:, passed:)
      clear
      @out.puts "Exercises\n\n"
      Exercise::IDS.each do |id|
        marker = id == exercise.id ? '>' : ' '
        state = completed.include?(id) ? 'done' : 'open'
        @out.puts "#{marker} [#{state}] #{id}"
      end
      footer(exercise, completed, passed, listing: true)
    end

    def footer(exercise, completed, passed, listing: false)
      @out.puts progress_line(completed.size)
      @out.puts "Current exercise: #{colorize(exercise.solution, 36)}"
      @out.puts colorize('Watching for saves · Ctrl-C to exit', 36)
      @out.puts "\n#{commands(passed, listing: listing)}"
    end

    private

    def clear
      @out.print "\e[3J\e[2J\e[H" if @out.tty?
    end

    def progress_line(count)
      filled = count * 20 / Exercise::IDS.size
      bar = colorize('#' * filled, 32) + colorize('-' * (20 - filled), 31)
      "\nProgress: [#{bar}] #{count}/#{Exercise::IDS.size}"
    end

    def commands(passed, listing:)
      return 's:show current / n:next (Enter) / q:quit (Enter) / ?:help' if listing

      passed ? 'n:next (Enter) / l:list / q:quit (Enter) / ?:help' : 'h:hint / l:list / q:quit (Enter) / ?:help'
    end

    def show_completed(exercise)
      @out.puts colorize('Exercise done ✓', 32)
      @out.puts "Solution for comparison: #{colorize(exercise.reference, 36)}"
      @out.puts 'When done experimenting, enter n to move on to the next exercise.'
    end

    def show_checks(exercise, result)
      @out.puts exercise.instructions
      @out.puts "\nEdit: #{exercise.solution}\n\n"
      @out.puts result.output
      @out.puts(result.exit_code.zero? ? colorize('PASS', 32) : colorize('FAIL', 31))
    end

    def colorize(text, code)
      return text unless @out.tty? && !ENV.key?('NO_COLOR')

      "\e[#{code}m#{text}\e[0m"
    end
  end
end
