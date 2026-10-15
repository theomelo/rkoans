# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class MethodContractsAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'method-contracts')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~'RUBY')
        module Exercises
          class MethodContracts
            def self.format_order(name, quantity=1, *extras, unit:, **options, &block)
              text = "#{name}:#{quantity}:#{unit}:#{extras.size}:#{'normal'}"
              block ? block.call(text) : text
             end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_method_defaults_and_block'
    end
  end
end
