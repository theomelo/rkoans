# frozen_string_literal: true

require 'json'
require_relative 'error'

module Rkoans
  # Describes packaged files without changing the single-file Ruby convention.
  class ExerciseDefinition
    attr_reader :runtime, :files, :editable_paths, :primary_path

    # @param root [String] packaged catalog root
    # @param id [String] validated catalog exercise ID
    def initialize(root:, id:)
      @root = File.expand_path(root)
      @id = id
      @folder = "exercises/#{id}"
      descriptor = File.join(@root, @folder, 'exercise.json')
      raise Error, 'Exercise descriptors cannot be symlinks.' if File.symlink?(descriptor)

      File.file?(descriptor) ? load_descriptor(descriptor) : ruby_definition
    rescue JSON::ParserError => e
      raise Error, "Invalid exercise definition: #{e.message}"
    end

    # @return [String] relative packaged starter location
    def starter(path)
      "#{@folder}/#{'template/' if application?}#{path}"
    end

    # @return [Boolean] whether the exercise uses an application template
    def application?
      runtime == 'rails'
    end

    # @return [Array<String>] complete declared asset inventory, excluding incidental files
    def assets
      name = @id.tr('-', '_')
      common = ["#{@folder}/brief.md", "#{@folder}/hint.md", "test/exercises/#{name}_test.rb",
                "sig/exercises/#{name}.rbs"]
      common << "#{@folder}/exercise.json" if application?
      common + files.map { |path| starter(path) } + editable_paths.map { |path| "solutions/#{@id}/#{path}" }
    end

    private

    # Derives the original filename convention for Ruby lessons.
    def ruby_definition
      @runtime = 'ruby'
      @primary_path = "#{@id.tr('-', '_')}.rb".freeze
      @files = [@primary_path].freeze
      @editable_paths = @files
    end

    # Loads a Rails descriptor and verifies all declared application inputs.
    def load_descriptor(path)
      data = JSON.parse(File.read(path))
      raise Error, 'Invalid application descriptor.' unless data.is_a?(Hash) && data['runtime'] == 'rails'

      @runtime = 'rails'
      @files = validated_paths(data['files'])
      @editable_paths = validated_paths(data['editable_paths'])
      @primary_path = data['primary_path'].freeze
      validate_editable_paths
      validate_application_assets
    end

    # Ensures the primary and editable files are part of the declared scaffold.
    def validate_editable_paths
      return if (@editable_paths - @files).empty? && @editable_paths.include?(@primary_path)

      raise Error, 'Editable and primary paths must belong to the declared application files.'
    end

    # Verifies every declared template and editable reference exists inside the package.
    def validate_application_assets
      (files.map { |name| starter(name) } + editable_paths.map { |name| "solutions/#{@id}/#{name}" }).each do |asset|
        validate_asset(asset)
      end
    end

    # @return [Array<String>] unique, contained relative paths
    def validated_paths(paths)
      valid = paths.is_a?(Array) && !paths.empty? && paths.uniq == paths && paths.all? { |path| relative_path?(path) }
      raise Error, 'Application paths must be unique relative file paths without traversal.' unless valid

      paths.each(&:freeze).freeze
    end

    # @return [Boolean] whether a path contains only safe, nonempty relative components
    def relative_path?(path)
      path.is_a?(String) && path.split('/', -1).all? do |part|
        part.match?(/\A[a-zA-Z0-9_.-]+\z/) && !%w[. ..].include?(part)
      end
    end

    # Ensures template and reference files exist inside the packaged root.
    def validate_asset(asset)
      path = File.join(@root, asset)
      return if File.file?(path) && File.realpath(path).start_with?("#{File.realpath(@root)}/")

      raise Error, "Missing or escaping application asset: #{asset}"
    end
  end
end
