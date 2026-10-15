# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'minitest/mock'

class WatcherTest < Minitest::Test
  # Drive polling and the clock explicitly so CI scheduling cannot split a save burst.
  def test_save_burst_is_debounced_and_unchanged_contents_do_not_rerun
    Dir.mktmpdir do |directory|
      path = File.join(directory, 'solution.rb')
      File.write(path, 'initial')
      now = 0.0
      runs = []
      polls = [
        [0.01, 'first save'], [0.04, 'second save'], [0.07, 'final save'],
        [0.16, nil], [0.18, nil], [0.20, 'final save'], [0.40, nil]
      ]
      keyboard = Object.new
      keyboard.define_singleton_method(:with_terminal) { |&block| block.call }
      keyboard.define_singleton_method(:read) do |_interval|
        throw :finished if polls.empty?

        now, contents = polls.shift
        File.write(path, contents) if contents
        nil
      end
      watcher = Rkoans::Watcher.new(path, debounce: 0.1)
      watcher.define_singleton_method(:monotonic_time) { now }

      Rkoans::Keyboard.stub(:new, keyboard) do
        catch(:finished) { watcher.run { runs << [now, File.read(path)] } }
      end

      assert_equal [[0.0, 'initial'], [0.18, 'final save']], runs
    end
  end

  # Poll both files and observe atomic replacement without wall-clock sleeps.
  def test_multiple_files_and_atomic_replacement
    Dir.mktmpdir do |directory|
      route = File.join(directory, 'routes.rb')
      controller = File.join(directory, 'controller.rb')
      File.write(route, 'initial route')
      File.write(controller, 'initial controller')
      now = 0.0
      runs = []
      polls = [
        [0.01, route, 'first save'], [0.04, controller, 'controller save'], [0.07, route, 'final save'],
        [0.16, nil, nil], [0.18, nil, nil], [0.20, route, 'final save'],
        [0.30, controller, :atomic], [0.42, nil, nil], [0.60, nil, nil]
      ]
      keyboard = scripted_keyboard(polls, directory) { |time| now = time }
      watcher = Rkoans::Watcher.new([route, controller], debounce: 0.1)
      watcher.define_singleton_method(:monotonic_time) { now }
      Rkoans::Keyboard.stub(:new, keyboard) do
        catch(:finished) { watcher.run { runs << [now, File.read(route), File.read(controller)] } }
      end

      assert_equal [[0.0, 'initial route', 'initial controller'],
                    [0.18, 'final save', 'controller save'], [0.42, 'final save', 'atomic save']], runs
    end
  end

  private

  # Advances a supplied clock while performing scripted saves against real files.
  def scripted_keyboard(polls, directory, &set_time)
    keyboard = Object.new
    keyboard.define_singleton_method(:with_terminal) { |&block| block.call }
    keyboard.define_singleton_method(:read) do |_interval|
      throw :finished if polls.empty?

      time, path, contents = polls.shift
      set_time.call(time)
      if contents == :atomic
        replacement = File.join(directory, 'replacement.rb')
        File.write(replacement, 'atomic save')
        File.rename(replacement, path)
      elsif path
        File.write(path, contents)
      end
      nil
    end
    keyboard
  end
end
