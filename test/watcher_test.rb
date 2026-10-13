# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'timeout'

class WatcherTest < Minitest::Test
  def test_save_burst_is_debounced_and_unchanged_contents_do_not_rerun
    Dir.mktmpdir do |directory|
      path = File.join(directory, 'solution.rb')
      File.write(path, 'initial')
      runs = Queue.new
      watcher = Thread.new do
        Rkoans::Watcher.new(path, interval: 0.01, debounce: 0.1).run { runs << File.read(path) }
      end

      assert_equal 'initial', Timeout.timeout(2) { runs.pop }
      File.write(path, 'first save')
      sleep 0.03
      File.write(path, 'second save')
      sleep 0.03
      File.write(path, 'final save')

      assert_equal 'final save', Timeout.timeout(2) { runs.pop }
      File.write(path, 'final save')
      sleep 0.2

      assert_predicate runs, :empty?
    ensure
      watcher&.kill
      watcher&.join
    end
  end
end
