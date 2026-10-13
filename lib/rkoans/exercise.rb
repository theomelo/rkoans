# frozen_string_literal: true

require 'fileutils'

module Rkoans
  # Locates the packaged exercise and creates its editable learner copy.
  class Exercise
    IDS = %w[collection-basics blocks-and-methods].freeze

    attr_reader :solution, :id

    # @param [String] directory
    def initialize(directory: File.join(Dir.home, 'ruby-koans'), id: IDS.first)
      raise Error, "Unknown exercise: #{id}; run rkoans list" unless IDS.include?(id)

      @id = id
      @source = File.expand_path("../../exercises/#{id}", __dir__)
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
      File.expand_path("../../test/exercises/#{id.tr('-', '_')}_test.rb", __dir__)
    end

    def reference
      File.expand_path("../../solutions/#{id}/#{File.basename(solution)}", __dir__)
    end

    def hint
      File.read(File.join(@source, 'hint.md'))
    end
  end
end
