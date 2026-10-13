# frozen_string_literal: true

require 'fileutils'
require 'tempfile'

module Rkoans
  # Remembers the active exercise without changing any learner files.
  class Selection
    def initialize(directory:)
      @path = File.join(directory, '.rkoans', 'selection')
    end

    def read
      File.read(@path).strip
    rescue Errno::ENOENT
      Exercise::IDS.first
    end

    def write(id)
      directory = File.dirname(@path)
      FileUtils.mkdir_p(directory)
      Tempfile.create('selection', directory) do |file|
        file.write("#{id}\n")
        file.close
        File.rename(file.path, @path)
      end
    end
  end
end
