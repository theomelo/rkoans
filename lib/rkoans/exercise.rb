# frozen_string_literal: true

require 'fileutils'

module Rkoans
  # Locates the packaged exercise and creates its editable learner copy.
  class Exercise
    attr_reader :solution, :id, :workspace, :definition

    # @param [String] directory
    # @param catalog [Catalog] source assets and allowed exercise IDs
    def initialize(directory: File.join(Dir.home, 'ruby-koans'), catalog: Catalog.new, id: catalog.ids.first)
      raise Error, "Unknown exercise: #{id}; run rkoans list" unless catalog.ids.include?(id)

      @id = id
      @root = catalog.root
      @source = File.join(@root, "exercises/#{id}")
      @directory = File.expand_path(directory)
      @workspace = File.join(@directory, 'exercises', id)
      @definition = ExerciseDefinition.new(root: @root, id: id)
      @solution = File.join(workspace, definition.primary_path)
    end

    # Creates missing workspace files, preserving every existing regular file.
    # @return [void]
    def prepare
      destinations = definition.files.to_h { |path| [path, safe_destination(path)] }
      destinations.each do |relative, target|
        FileUtils.mkdir_p(File.dirname(target))
        copy_missing(File.join(@root, definition.starter(relative)), target)
      end
      nil
    end

    # @return [Array<String>] absolute paths whose saves rerun checks
    def editable_files
      definition.editable_paths.map { |path| File.join(workspace, path) }
    end

    # @return [Hash<String, String>] editable file paths paired with reference paths
    def reference_files
      definition.editable_paths.to_h do |path|
        [File.join(workspace, path), File.join(@root, 'solutions', id, path)]
      end
    end

    # @return [String] runtime used to execute this lesson
    def runtime
      definition.runtime
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
      reference_files.fetch(solution)
    end

    def hint
      File.read(File.join(@source, 'hint.md'))
    end

    private

    # Rejects symlinks at the study root and every destination component before writing.
    # @return [String] validated destination
    def safe_destination(relative)
      path = @directory
      ([nil] + ['exercises', id] + relative.split('/')).each do |part|
        path = File.join(path, part) if part
        raise Error, "Workspace paths cannot be symlinks: #{path}" if File.symlink?(path)
      end
      path
    end

    # Exclusively creates a starter so restarts cannot replace learner edits.
    # @return [Integer, nil]
    def copy_missing(source, target)
      File.open(target, File::WRONLY | File::CREAT | File::EXCL) { |file| file.write(File.read(source)) }
    rescue Errno::EEXIST
      raise Error, "Workspace file is not a regular file: #{target}" unless File.file?(target)

      nil
    end
  end
end
