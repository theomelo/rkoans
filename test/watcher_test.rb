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
end
