# frozen_string_literal: true

require ARGV.shift
class TimeAndDateTest < Minitest::Test
  # Checks time offset.
  def test_time_offset
    assert_equal '2026-10-12T08:00:00Z', Exercises::TimeAndDate.utc('2026-10-12T10:00:00+02:00')
  end

  # Checks calendar days.
  def test_calendar_days
    [
      ['2024-02-28', '2024-03-01', 2],
      ['2024-03-01', '2024-02-28', -2]
    ].each do |first, last, expected|
      days = Exercises::TimeAndDate.days_between(first, last)

      assert_instance_of Integer, days
      assert_equal expected, days
    end
  end
end
