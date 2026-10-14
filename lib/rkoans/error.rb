# frozen_string_literal: true

module Rkoans
  # Identifies command and installation errors that can be reported without a backtrace.
  class Error < StandardError; end
end
