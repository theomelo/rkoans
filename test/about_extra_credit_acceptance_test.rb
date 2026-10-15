# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutExtraCreditAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-extra-credit')
      exercise.prepare
      incomplete_repairs.each do |override, check|
        File.write(exercise.solution, File.read(exercise.reference) + override)
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, check
        assert_includes result.output, '0 errors'
      end
    end
  end

  private

  # Each repair isolates one rule while retaining the reference's other behavior.
  # @return [Array<Array<String>>] override source and the check that must reject it
  def incomplete_repairs
    [
      [<<~RUBY, 'test_entry_threshold_and_later_banking'],
        module Exercises
          class AboutExtraCredit::Player
            def bank(points)
              @score += points
            end
          end
        end
      RUBY
      [<<~RUBY, 'test_bust_discards_the_entire_turn'],
        module Exercises
          class AboutExtraCredit::Game
            def turn_points(rolls)
              rolls.sum { |roll| score_roll(roll).first }
            end
          end
        end
      RUBY
      [<<~RUBY, 'test_every_other_player_gets_one_final_turn'],
        module Exercises
          class AboutExtraCredit::Game
            def advance(total)
              @remaining = 0 if total >= 3000
              @current = (current + 1) % players.size
            end
          end
        end
      RUBY
      [<<~RUBY, 'test_final_round_starts_at_3000_and_wraps_turn_order']
        module Exercises
          class AboutExtraCredit::Game
            def advance(total)
              if @remaining
                @remaining -= 1
              elsif total > 3000
                @remaining = players.size - 1
              end
              @current = (current + 1) % players.size
            end
          end
        end
      RUBY
    ]
  end
end
