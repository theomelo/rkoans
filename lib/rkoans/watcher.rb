# frozen_string_literal: true

require 'digest'

module Rkoans
  # Reruns a block after file contents change and saves settle.
  class Watcher
    # @param [String] path
    # @param [Float] interval
    # @param [Float] debounce
    def initialize(path, interval: 0.1, debounce: 0.2)
      @path = path
      @interval = interval
      @debounce = debounce
    end

    # Calls the block initially and after saves, until interrupted.
    def run
      previous = fingerprint
      changed_at = nil
      yield
      loop do
        sleep @interval
        current = fingerprint
        if current != previous
          previous = current
          changed_at = monotonic_time
        elsif changed_at && monotonic_time - changed_at >= @debounce
          changed_at = nil
          yield
        end
      end
    end

    private

    # @return [String, nil]
    def fingerprint
      Digest::SHA256.file(@path).hexdigest
    rescue Errno::ENOENT
      nil
    end

    # @return [Float]
    def monotonic_time
      Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end
  end
end
