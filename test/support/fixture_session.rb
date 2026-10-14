# frozen_string_literal: true

require 'rkoans'

catalog = Rkoans::Catalog.new(root: File.expand_path('../fixtures/curriculum', __dir__))
exit Rkoans::CLI.new(catalog: catalog).run(ARGV)
