# frozen_string_literal: true

require 'json'
require 'fileutils'
require 'tempfile'

module Rkoans
  # Stores completed exercise IDs independently of the current selection.
  class Progress
    def initialize(directory:)
      @path = File.join(directory, '.rkoans', 'completed.json')
    end

    def completed
      ids = JSON.parse(File.read(@path))
      raise Error, "Invalid progress file: #{@path}" unless ids.is_a?(Array) && ids.all?(String)

      ids & Exercise::IDS
    rescue Errno::ENOENT
      []
    rescue JSON::ParserError
      raise Error, "Invalid progress file: #{@path}"
    end

    def mark_done(id)
      ids = completed
      return if ids.include?(id)

      FileUtils.mkdir_p(File.dirname(@path))
      Tempfile.create('completed', File.dirname(@path)) do |file|
        file.write(JSON.generate(ids + [id]))
        file.close
        File.rename(file.path, @path)
      end
    end
  end
end
