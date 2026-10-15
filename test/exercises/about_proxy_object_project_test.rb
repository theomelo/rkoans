# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

class AboutProxyObjectProjectTest < Minitest::Test
  # A receiver with state, arguments, keywords and a block.
  class Television
    attr_accessor :channel

    # Toggle the current power state.
    def power
      @on = !@on
    end

    # @return [Boolean] current power state
    def on?
      !!@on
    end

    # Yield a formatted payload, keeping positional and keyword arguments distinct.
    def broadcast(message, suffix: '!')
      text = "#{message}#{suffix}"
      block_given? ? yield(text) : text
    end

    private

    # Private target behavior must stay inaccessible through the proxy.
    def secret
      :private
    end
  end

  # State changes and exact message order must reach the real target.
  def test_tv_methods_and_recorded_messages
    tv = Exercises::AboutProxyObjectProject::Proxy.new(Television.new)
    tv.power
    tv.channel = 10

    assert_equal %i[power channel=], tv.messages
    assert_equal 10, tv.channel
    assert_predicate tv, :on?
    tv.power

    assert tv.called?(:power)
    refute tv.called?(:unseen)
    assert_equal 2, tv.number_of_times_called(:power)
    assert_equal 0, tv.number_of_times_called(:unseen)
    assert_respond_to tv, :channel
    refute_respond_to tv, :no_such_method
    assert_raises(NoMethodError) { tv.no_such_method }
    refute_respond_to tv, :secret
    assert_raises(NoMethodError) { tv.secret }
  end

  # A proxy must work with other targets and propagate return values.
  def test_string_target_and_return_values
    proxy = Exercises::AboutProxyObjectProject::Proxy.new(+'Code Mash 2009')
    proxy.upcase!

    assert_equal %w[CODE MASH 2009], proxy.split
    assert_equal %i[upcase! split], proxy.messages
  end

  # Forward keywords and the caller's block without treating keywords as a hash.
  def test_keywords_and_blocks_reach_the_target
    proxy = Exercises::AboutProxyObjectProject::Proxy.new(Television.new)

    assert_equal 'RUBY?', proxy.broadcast('ruby', suffix: '?', &:upcase)
  end
end
