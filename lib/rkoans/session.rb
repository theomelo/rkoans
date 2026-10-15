# frozen_string_literal: true

module Rkoans
  # Coordinates checks, file watching, keyboard commands, and completion.
  class Session
    # @param catalog [Catalog] ordered exercises used by this component
    def initialize(directory:, out:, input:, catalog: Catalog.new)
      @catalog = catalog
      @directory = directory
      @input = input
      @listing = false
      @selection = Selection.new(directory: directory, catalog: catalog)
      @checker = Checker.new(rails_runtime: RailsRuntime.for_workspace(directory))
      @progress = Progress.new(directory: directory, catalog: catalog)
      @view = TerminalView.new(out: out, catalog: catalog)
    end

    # Keeps the current exercise open until the user advances or quits.
    def start(id)
      selected = id || @selection.read
      loop do
        activate(selected)
        selected = watch
        return selected if selected.is_a?(Integer)
      end
    end

    # @return [Integer]
    def check
      @exercise = Exercise.new(directory: @directory, id: @selection.read, catalog: @catalog)
      raise Error, 'No exercise found. Run rkoans start first.' unless File.file?(@exercise.solution)

      show_checks(watching: false)
    end

    private

    def activate(id)
      @listing = false
      @exercise = Exercise.new(directory: @directory, id: id, catalog: @catalog)
      @exercise.prepare
      @selection.write(id)
    end

    def watch
      catch(:session_action) do
        Watcher.new(@exercise.editable_files).run(input: @input) do |command|
          result = command ? handle_command(command) : show_checks(watching: true)
          throw :session_action, 2 if result == 2
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
        throw :session_action, 0
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
      ids = @catalog.ids
      next_id = ids[ids.index(@exercise.id) + 1]
      throw :session_action, next_id if next_id

      message = if @progress.completed.size == ids.size
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
