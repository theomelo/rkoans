# frozen_string_literal: true

require 'time'
require 'date'
module Exercises
  # Implement utc(text) to parse an ISO8601 timestamp with an explicit offset and return the same
  # instant formatted in UTC.
  class TimeAndDate
    # Normalizes an offset ISO8601 timestamp to its UTC representation.
    # @return [String]
    def self.utc(text) = Time.iso8601(text).utc.iso8601
    # Returns the signed integer calendar-day difference between ISO dates.
    # @return [Integer]
    def self.days_between(first, last) = (Date.iso8601(last) - Date.iso8601(first)).to_i
  end
end
