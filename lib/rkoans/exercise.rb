# frozen_string_literal: true

require 'fileutils'

module Rkoans
  # Locates the packaged exercise and creates its editable learner copy.
  class Exercise
    attr_reader :solution, :id

    # @param [String] directory
    # @param catalog [Catalog] source assets and allowed exercise IDs
    def initialize(directory: File.join(Dir.home, 'ruby-koans'), catalog: Catalog.new, id: catalog.ids.first)
      raise Error, "Unknown exercise: #{id}; run rkoans list" unless catalog.ids.include?(id)

      @id = id
      @root = catalog.root
      @source = File.join(@root, "exercises/#{id}")
      @solution = File.join(File.expand_path(directory), 'exercises', id, "#{id.tr('-', '_')}.rb")
    end

    # @return [Integer, nil]
    def prepare
      FileUtils.mkdir_p(File.dirname(solution))
      File.open(solution, File::WRONLY | File::CREAT | File::EXCL) do |file|
        file.write(File.read(File.join(@source, File.basename(solution))))
      end
    rescue Errno::EEXIST
      # Starting again preserves the learner's work.
      nil
    end

    # @return [String]
    def instructions
      File.read(File.join(@source, 'brief.md'))
    end

    # @return [String]
    def checks
      File.join(@root, "test/exercises/#{id.tr('-', '_')}_test.rb")
    end

    def reference
      File.join(@root, "solutions/#{id}/#{File.basename(solution)}")
    end

    def hint
      File.read(File.join(@source, 'hint.md'))
    end
  end
end
