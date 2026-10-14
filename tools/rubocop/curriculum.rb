# frozen_string_literal: true

require 'json'
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
          ids = JSON.parse(File.read(File.join(root, 'exercises/catalog.json')))
          unless valid_ids?(ids)
            report('Invalid exercise catalog: expected unique exercise IDs in order.')
            return
          end

          check_assets(root, ids)
          check_registration(root, ids)
        rescue JSON::ParserError, Errno::ENOENT => e
          report("Invalid exercise catalog: #{e.message}")
        end

        # Invalidates cached lint results when the catalog or asset inventory changes.
        # @return [String]
        def external_dependency_checksum
          root = File.expand_path('../..', __dir__)
          paths = Dir.glob("#{root}/{exercises,solutions,test/exercises,sig/exercises}/**/*")
          catalog = File.join(root, 'exercises/catalog.json')
          Digest::SHA256.hexdigest(paths.sort.join("\n") + (File.file?(catalog) ? File.read(catalog) : ''))
        end

        private

        # @param root [String] gem directory
        # @param ids [Array<String>] registered IDs
        # @return [void]
        def check_assets(root, ids)
          ids.each do |id|
            assets(id).each do |path|
              report("Missing curriculum asset: #{path}") unless File.file?(File.join(root, path))
            end
          end
        end

        # @param root [String] gem directory
        # @param ids [Array<String>] registered IDs
        # @return [void]
        def check_registration(root, ids)
          directories = Dir.children(File.join(root, 'exercises')).select do |name|
            File.directory?(File.join(root, 'exercises', name))
          end
          (directories - ids).sort.each { |id| report("Exercise directory is not registered: #{id}") }
        end

        # @param ids [Object] parsed catalog
        # @return [Boolean]
        def valid_ids?(ids)
          ids.is_a?(Array) && !ids.empty? && ids.uniq == ids &&
            ids.all? { |id| id.is_a?(String) && id.match?(/\A[a-z]+(?:-[a-z]+)*\z/) }
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
