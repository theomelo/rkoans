# frozen_string_literal: true

require_relative 'command_support'

# Runs session behavior against a fixed curriculum, independent of shipped lessons.
module FixtureSupport
  include CommandSupport

  FIXTURE_ROOT = File.join(ROOT, 'test/fixtures/curriculum')
  FIXTURE_COMMAND = [RbConfig.ruby, '-I', File.join(ROOT, 'lib'),
                     File.join(ROOT, 'test/support/fixture_session.rb')].freeze

  private

  # @return [Array<String>] isolated fixture CLI invocation
  def command
    FIXTURE_COMMAND
  end

  # @param id [String] fixed fixture ID
  # @return [String] passing source used to arrange a completed exercise
  def reference_source(id = 'first-exercise')
    File.read(File.join(FIXTURE_ROOT, 'solutions', id, "#{id.tr('-', '_')}.rb"))
  end

  # @param directory [String] temporary learner home
  # @return [String] first fixture exercise's editable path
  def solution(directory)
    File.join(directory, 'ruby-koans/exercises/first-exercise/first_exercise.rb')
  end
end
