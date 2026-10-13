# frozen_string_literal: true

module Rkoans
  # Coordinates checks, file watching, keyboard commands, and completion.
  class Session
    def initialize(directory:, out:, input:)
      @directory = directory
      @out = out
      @input = input
      @selection = Selection.new(directory: directory)
      @checker = Checker.new
      @progress = Progress.new(directory: directory)
      @view = TerminalView.new(out: out)
      @listing = false
    end

    # Keeps the current exercise open until the user advances or quits.
    def start(id)
      selected = id || @selection.read
      loop do
        activate(selected)
        action = watch
        return 0 if action == :quit

        selected = action
      end
    end

    # @return [Integer]
    def check
      @exercise = Exercise.new(directory: @directory, id: @selection.read)
      raise Error, 'No exercise found. Run rkoans start first.' unless File.file?(@exercise.solution)

      show_checks(watching: false)
    end

    private

    def activate(id)
      @listing = false
      @exercise = Exercise.new(directory: @directory, id: id)
      @exercise.prepare
      @selection.write(id)
    end

    def watch
      catch(:session_action) do
        Watcher.new(@exercise.solution).run(input: @input) do |command|
          command ? handle_command(command) : show_checks(watching: true)
        end
      end
    end

    def handle_command(command)
      case command
      when 'n'
        @listing = false
        advance
      when 'q'
        show_message('Stopped. Your edits are preserved.', watching: false)
        throw :session_action, :quit
      when 'l', 's'
        @listing = command == 'l'
        show_checks(watching: true)
      when 'h' then show_hint
      when '?' then show_message(TerminalView::HELP)
      else
        show_message('Press ? for keyboard help.')
      end
    end

    def advance
      result = check_result
      unless result.exit_code.zero?
        render(result, watching: true, message: 'Finish the current exercise before moving on.')
        return
      end
      next_id = Exercise::IDS[Exercise::IDS.index(@exercise.id) + 1]
      throw :session_action, next_id if next_id

      message = if @progress.completed.size == Exercise::IDS.size
                  'All exercises complete. You can keep experimenting or enter q to quit.'
                else
                  'No next exercise. Other exercises remain; enter l to list them or q to quit.'
                end
      render(result, watching: true, message: message)
    end

    # @param [Boolean] watching
    # @return [Integer]
    def show_checks(watching:)
      render(check_result, watching: watching)
    end

    def check_result
      result = @checker.run(@exercise)
      @passed = result.exit_code.zero?
      @progress.mark_done(@exercise.id) if @passed
      result
    end

    def render(result, watching:, message: nil)
      if watching && @listing
        @view.show_list(exercise: @exercise, completed: @progress.completed, passed: @passed)
      else
        @view.render(exercise: @exercise, result: result, completed: @progress.completed,
                     watching: watching, message: message)
      end
      result.exit_code
    end

    def show_message(message, watching: true)
      mode = @listing ? :list : :current
      mode = :quit unless watching
      @view.show_message(message, exercise: @exercise, completed: @progress.completed,
                                  passed: @passed, mode: mode)
    end

    def show_hint
      return if @listing || @passed

      show_message(@exercise.hint)
    end
  end
end
