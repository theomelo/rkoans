# frozen_string_literal: true

require_relative '../../lib/rkoans/catalog'
require_relative '../../lib/rkoans/exercise_definition'
require 'digest'

module RuboCop
  module Cop
    module Rkoans
      # Checks catalog registration and required assets when linting the gemspec.
      # Run through the repository configuration; no learner code is executed.
      class Curriculum < Base
        # Reports catalog errors and missing or unregistered curriculum assets.
        # @return [void]
        def on_new_investigation
          root = File.dirname(processed_source.file_path)
          ids = ::Rkoans::Catalog.new(root: root).ids
          messages = missing_assets(root, ids) + unregistered_directories(root, ids)
          report(messages.join("\n")) unless messages.empty?
        rescue ::Rkoans::Error => e
          report(e.message)
        end

        # Invalidates cached lint results when catalog, assets, or shared validation rules change.
        # @return [String]
        def external_dependency_checksum
          root = File.expand_path('../..', __dir__)
          paths = Dir.glob("#{root}/{exercises,solutions,test/exercises,sig/exercises}/**/*")
          contents = validation_sources(root).filter_map { |path| File.read(path) if File.file?(path) }
          Digest::SHA256.hexdigest((paths.sort + contents).join("\n"))
        end

        private

        # @return [Array<String>] definitions whose contents affect asset validation
        def validation_sources(root)
          rules = %w[catalog.rb error.rb exercise_definition.rb].map { |name| File.join(root, 'lib/rkoans', name) }
          rules + [File.join(root, 'exercises/catalog.json')] + Dir.glob("#{root}/exercises/*/exercise.json")
        end

        # @param root [String] gem directory
        # @param ids [Array<String>] registered IDs
        # @return [Array<String>] all missing asset diagnostics in catalog order
        def missing_assets(root, ids)
          ids.flat_map { |id| ::Rkoans::ExerciseDefinition.new(root: root, id: id).assets }.filter_map do |path|
            "Missing curriculum asset: #{path}" unless File.file?(File.join(root, path))
          end
        end

        # @param root [String] gem directory
        # @param ids [Array<String>] registered IDs
        # @return [Array<String>] unregistered exercise directory diagnostics
        def unregistered_directories(root, ids)
          directories = Dir.children(File.join(root, 'exercises')).select do |name|
            File.directory?(File.join(root, 'exercises', name))
          end
          (directories - ids).sort.map { |id| "Exercise directory is not registered: #{id}" }
        end

        # @param message [String] actionable curriculum diagnostic
        # @return [void]
        def report(message)
          add_offense(processed_source.ast, message: message)
        end
      end
    end
  end
end
