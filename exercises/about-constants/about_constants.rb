# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for constants examples.
  class AboutConstants
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Nested constants may also be referenced with relative paths.
        # assert_equal __, C
        # Predict: C
        nested_constants_may_also_be_referenced_with_relative_paths_one: :fill_me_in,
        # Top level constants are referenced by double colons.
        # assert_equal __, ::C
        # Predict: ::C
        top_level_constants_are_referenced_by_double_colons_one: :fill_me_in,
        # Nested constants are referenced by their complete path.
        # assert_equal __, AboutConstantsTest::C
        # assert_equal __, ::AboutConstantsTest::C
        # Predict: AboutConstantsTest::C
        nested_constants_are_referenced_by_their_complete_path_one: :fill_me_in,
        # Predict: ::AboutConstantsTest::C
        nested_constants_are_referenced_by_their_complete_path_two: :fill_me_in,
        # Nested classes inherit constants from enclosing classes.
        # assert_equal __, Animal::NestedAnimal.new.legs_in_nested_animal
        # Predict: Animal::NestedAnimal.new.legs_in_nested_animal
        nested_classes_inherit_constants_from_enclosing_classes_one: :fill_me_in,
        # Subclasses inherit constants from parent classes.
        # assert_equal __, Reptile.new.legs_in_reptile
        # Predict: Reptile.new.legs_in_reptile
        subclasses_inherit_constants_from_parent_classes_one: :fill_me_in,
        # Who wins with both nested and inherited constants.
        # assert_equal __, MyAnimals::Bird.new.legs_in_bird
        # Predict: MyAnimals::Bird.new.legs_in_bird
        who_wins_with_both_nested_and_inherited_constants_one: :fill_me_in,
        # Who wins with explicit scoping on class definition.
        # assert_equal __, MyAnimals::Oyster.new.legs_in_oyster
        # Predict: MyAnimals::Oyster.new.legs_in_oyster
        who_wins_with_explicit_scoping_on_class_definition_one: :fill_me_in
      }
    end
  end
end
