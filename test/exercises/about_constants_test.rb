# frozen_string_literal: true

# The explicit class path changes lexical constant lookup.
# rubocop:disable Style/ClassAndModuleChildren

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
C = 'top level'

class AboutConstantsTest < Minitest::Test
  C = 'nested'

  # Checks nested constants may also be referenced with relative paths.
  def test_nested_constants_may_also_be_referenced_with_relative_paths
    assert_equal Exercises::AboutConstants.koans.fetch(:nested_constants_may_also_be_referenced_with_relative_paths_one),
                 C
  end

  # Checks top level constants are referenced by double colons.
  def test_top_level_constants_are_referenced_by_double_colons
    assert_equal Exercises::AboutConstants.koans.fetch(:top_level_constants_are_referenced_by_double_colons_one), ::C
  end

  # Checks nested constants are referenced by their complete path.
  def test_nested_constants_are_referenced_by_their_complete_path
    assert_equal Exercises::AboutConstants.koans.fetch(:nested_constants_are_referenced_by_their_complete_path_one), AboutConstantsTest::C
    assert_equal Exercises::AboutConstants.koans.fetch(:nested_constants_are_referenced_by_their_complete_path_two),
                 ::AboutConstantsTest::C
  end

  # ------------------------------------------------------------------

  class Animal
    LEGS = 4
    # Demonstrates legs in animal.
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      # Demonstrates legs in nested animal.
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  # Checks nested classes inherit constants from enclosing classes.
  def test_nested_classes_inherit_constants_from_enclosing_classes
    assert_equal Exercises::AboutConstants.koans.fetch(:nested_classes_inherit_constants_from_enclosing_classes_one), Animal::NestedAnimal.new.legs_in_nested_animal
  end

  # ------------------------------------------------------------------

  class Reptile < Animal
    # Demonstrates legs in reptile.
    def legs_in_reptile
      LEGS
    end
  end

  # Checks subclasses inherit constants from parent classes.
  def test_subclasses_inherit_constants_from_parent_classes
    assert_equal Exercises::AboutConstants.koans.fetch(:subclasses_inherit_constants_from_parent_classes_one),
                 Reptile.new.legs_in_reptile
  end

  # ------------------------------------------------------------------

  class MyAnimals
    LEGS = 2

    class Bird < Animal
      # Demonstrates legs in bird.
      def legs_in_bird
        LEGS
      end
    end
  end

  # Checks who wins with both nested and inherited constants.
  def test_who_wins_with_both_nested_and_inherited_constants
    assert_equal Exercises::AboutConstants.koans.fetch(:who_wins_with_both_nested_and_inherited_constants_one), MyAnimals::Bird.new.legs_in_bird
  end

  # QUESTION: Which has precedence: The constant in the lexical scope,
  # or the constant from the inheritance hierarchy?

  # ------------------------------------------------------------------

  class MyAnimals::Oyster < Animal
    # Demonstrates legs in oyster.
    def legs_in_oyster
      LEGS
    end
  end

  # Checks who wins with explicit scoping on class definition.
  def test_who_wins_with_explicit_scoping_on_class_definition
    assert_equal Exercises::AboutConstants.koans.fetch(:who_wins_with_explicit_scoping_on_class_definition_one), MyAnimals::Oyster.new.legs_in_oyster
  end

  # QUESTION: Now which has precedence: The constant in the lexical
  # scope, or the constant from the inheritance hierarchy?  Why is it
  # different than the previous answer?
end

# rubocop:enable Style/ClassAndModuleChildren
