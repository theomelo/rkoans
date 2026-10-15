# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutOpenClassesTest < Minitest::Test
  class Dog
    # Demonstrates bark.
    def bark
      'WOOF'
    end
  end

  # Checks as defined dogs do bark.
  def test_as_defined_dogs_do_bark
    fido = Dog.new

    assert_equal Exercises::AboutOpenClasses.koans.fetch(:as_defined_dogs_do_bark_one), fido.bark
  end

  # ------------------------------------------------------------------

  # Open the existing Dog class and add a new method.
  class Dog
    # Demonstrates wag.
    def wag
      'HAPPY'
    end
  end

  # Checks after reopening dogs can both wag and bark.
  def test_after_reopening_dogs_can_both_wag_and_bark
    fido = Dog.new

    assert_equal Exercises::AboutOpenClasses.koans.fetch(:after_reopening_dogs_can_both_wag_and_bark_one), fido.wag
    assert_equal Exercises::AboutOpenClasses.koans.fetch(:after_reopening_dogs_can_both_wag_and_bark_two), fido.bark
  end

  # ------------------------------------------------------------------

  class ::Integer
    # Demonstrates answer to life universe and everything?.
    def answer_to_life_universe_and_everything?
      self == 42
    end
  end

  # Checks even existing built in classes can be reopened.
  def test_even_existing_built_in_classes_can_be_reopened
    assert_equal Exercises::AboutOpenClasses.koans.fetch(:even_existing_built_in_classes_can_be_reopened_one),
                 1.answer_to_life_universe_and_everything?
    assert_equal Exercises::AboutOpenClasses.koans.fetch(:even_existing_built_in_classes_can_be_reopened_two),
                 42.answer_to_life_universe_and_everything?
  end

  # NOTE: To understand why we need the :: before Integer, you need to
  # become enlightened about scope.
end
