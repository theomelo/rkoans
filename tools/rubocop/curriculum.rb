# frozen_string_literal: true

require_relative '../../lib/rkoans/catalog'
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
          catalog = File.join(root, 'exercises/catalog.json')
          rules = %w[catalog.rb error.rb].map { |name| File.read(File.join(root, 'lib/rkoans', name)) }.join
          Digest::SHA256.hexdigest(paths.sort.join("\n") + (File.file?(catalog) ? File.read(catalog) : '') + rules)
        end

        private

        # @param root [String] gem directory
        # @param ids [Array<String>] registered IDs
        # @return [Array<String>] all missing asset diagnostics in catalog order
        def missing_assets(root, ids)
          ids.flat_map { |id| assets(id) }.filter_map do |path|
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

        # @param id [String] registered exercise ID
        # @return [Array<String>] required paths relative to the gem root
        def assets(id)
          name = id.tr('-', '_')
          %W[exercises/#{id}/#{name}.rb exercises/#{id}/brief.md exercises/#{id}/hint.md
             test/exercises/#{name}_test.rb sig/exercises/#{name}.rbs solutions/#{id}/#{name}.rb]
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
