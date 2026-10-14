# frozen_string_literal: true

require 'json'

module Rkoans
  # Loads the ordered exercise IDs and their packaged asset root.
  class Catalog
    attr_reader :root, :ids

    # @param root [String] directory containing exercises, checks, and references
    def initialize(root: File.expand_path('../..', __dir__))
      @root = File.expand_path(root)
      @ids = JSON.parse(File.read(File.join(@root, 'exercises/catalog.json')))
      raise Error, 'Exercise catalog must contain unique exercise IDs in order.' unless valid_ids?

      @ids.each(&:freeze)
      @ids.freeze
    rescue JSON::ParserError => e
      raise Error, "Invalid exercise catalog: #{e.message}"
    end

    private

    # @return [Boolean] whether IDs are unique, nonempty, and safe for asset paths
    def valid_ids?
      @ids.is_a?(Array) && !@ids.empty? && @ids.uniq == @ids &&
        @ids.all? { |id| id.is_a?(String) && id.match?(/\A[a-z]+(?:-[a-z]+)*\z/) }
    end
  end
end
