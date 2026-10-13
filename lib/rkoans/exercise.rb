# frozen_string_literal: true

require 'fileutils'

module Rkoans
  # Locates the packaged exercise and creates its editable learner copy.
  class Exercise
    attr_reader :solution

    # @param [String] directory
    def initialize(directory: File.join(Dir.home, 'ruby-koans'))
      @source = File.expand_path('../../exercises/collection-basics', __dir__)
      @solution = File.join(File.expand_path(directory), 'exercises/collection-basics/solution.rb')
    end

    # @return [Integer, nil]
    def prepare
      FileUtils.mkdir_p(File.dirname(solution))
      File.open(solution, File::WRONLY | File::CREAT | File::EXCL) do |file|
        file.write(File.read(File.join(@source, 'starter.rb')))
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
      File.expand_path('../../test/exercises/collection_basics_test.rb', __dir__)
    end
  end
end
