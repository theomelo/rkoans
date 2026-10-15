# frozen_string_literal: true

module Exercises
  # Study this setup, then fill predictions: a module Catalog has LABEL="outer"; Catalog::Item has
  # LABEL="item" and Catalog::Item::Nested reads LABEL.
  class ConstantScope
    # Returns predictions for the expressions described in the brief.
    # @return [Hash<Symbol, Object>]
    def self.predictions = { lexical_label: 'item', shared_class_count: 1, new_block_local_visible: false }

    # Creates a new counter closure with independent local state.
    # @return [Proc]
    def self.counter
      count = 0
      -> { count += 1 }
    end
  end
end
