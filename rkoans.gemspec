# frozen_string_literal: true

require_relative 'lib/rkoans/version'
require_relative 'lib/rkoans/exercise_definition'

Gem::Specification.new do |s|
  s.name = 'rkoans'
  s.version = Rkoans::VERSION
  s.authors = ['Theo Melo']
  s.email = ['9499829+theomelo@users.noreply.github.com']

  s.summary = 'Ruby and Rails challenges'
  s.description = 'Ruby and Rails challenges for learning and practicing'
  s.homepage = 'https://github.com/theomelo/rkoans'
  # These licenses cover different files; they are not alternative choices.
  s.licenses = ['MIT', 'CC-BY-NC-SA-3.0']
  s.required_ruby_version = '>= 4.0.7'
  s.metadata['allowed_push_host'] = 'https://rubygems.org'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['changelog_uri'] = "#{s.homepage}/blob/main/CHANGELOG.md"
  s.metadata['rubygems_mfa_required'] = 'true'
  s.metadata['license_scope'] = 'MIT: CLI and original exercises; CC-BY-NC-SA-3.0: adapted Ruby Koans. ' \
                                'See THIRD_PARTY_NOTICES.md for covered files and terms.'

  s.files = Dir.chdir(__dir__) do
    exercise_files = Dir['exercises/*/brief.md'].flat_map do |brief|
      id = File.basename(File.dirname(brief))
      Rkoans::ExerciseDefinition.new(root: __dir__, id: id).assets
    end
    (Dir['lib/**/*.rb', 'exe/*', 'sig/**/*.rbs', 'test/exercises/*_test.rb', '*.md',
         'LICENSE.txt', 'exercises/catalog.json', 'runtime/rails/Gemfile', 'runtime/rails/Gemfile.lock'] +
      exercise_files).select do |file|
      File.file?(file) && !file.start_with?('sig/rubocop/')
    end
  end
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency 'minitest', '~> 5.16'
end
