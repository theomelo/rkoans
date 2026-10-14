# frozen_string_literal: true

require 'fileutils'
require 'tempfile'

module Rkoans
  # Remembers the active exercise without changing any learner files.
  class Selection
    # @param catalog [Catalog] ordered exercises used by this component
    def initialize(directory:, catalog: Catalog.new)
      @catalog = catalog
      @path = File.join(directory, '.rkoans', 'selection')
    end

    def read
      File.read(@path).strip
    rescue Errno::ENOENT
      @catalog.ids.first
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
