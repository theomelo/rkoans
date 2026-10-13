# frozen_string_literal: true

require_relative 'rkoans/version'
require_relative 'rkoans/exercise'
require_relative 'rkoans/checker'
require_relative 'rkoans/watcher'
require_relative 'rkoans/cli'

module Rkoans
  class Error < StandardError; end
end
