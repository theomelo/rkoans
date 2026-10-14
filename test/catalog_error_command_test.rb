# frozen_string_literal: true

require 'test_helper'
require_relative 'support/command_support'

class CatalogErrorCommandTest < Minitest::Test
  include CommandSupport

  # A broken installation must return a setup error without a Ruby backtrace.
  def test_invalid_and_missing_catalogs_exit_cleanly
    Dir.mktmpdir do |directory|
      %w[lib exe].each { |path| FileUtils.cp_r(File.join(ROOT, path), directory) }
      FileUtils.mkdir_p(File.join(directory, 'exercises'))
      path = File.join(directory, 'exercises/catalog.json')
      ['{', '["first", "first"]', nil].each do |contents|
        if contents
          File.write(path, contents)
        else
          File.delete(path)
        end
        output, errors, status = Open3.capture3({ 'RUBYOPT' => nil, 'RUBYLIB' => nil, 'BUNDLE_GEMFILE' => nil },
                                                RbConfig.ruby, '-I', File.join(directory, 'lib'),
                                                File.join(directory, 'exe/rkoans'), 'check', chdir: directory)

        assert_equal 2, status.exitstatus
        assert_empty output
        assert_match(/Invalid exercise catalog/, errors)
        refute_match(/from .*\.rb|catalog\.rb:\d+/, errors)
      end
    end
  end
end
