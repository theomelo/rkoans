# frozen_string_literal: true

require_relative 'lib/rkoans/version'

Gem::Specification.new do |s|
  s.name = 'rkoans'
  s.version = Rkoans::VERSION
  s.authors = ['Theo Melo']
  s.email = ['9499829+theomelo@users.noreply.github.com']

  s.summary = 'Ruby and Rails challenges'
  s.description = 'Ruby and Rails challenges for learning and practicing'
  s.homepage = 'https://github.com/theomelo/rkoans'
  s.license = 'MIT'
  s.required_ruby_version = '>= 4.0.7'
  s.metadata['allowed_push_host'] = 'https://rubygems.org'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['changelog_uri'] = "#{s.homepage}/blob/main/CHANGELOG.md"
  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = Dir.chdir(__dir__) do
    exercise_files = Dir['exercises/*/brief.md'].flat_map do |brief|
      folder = File.dirname(brief)
      [brief, "#{folder}/hint.md", "#{folder}/#{File.basename(folder).tr('-', '_')}.rb"]
    end
    (Dir['lib/**/*.rb', 'exe/*', 'sig/**/*.rbs', 'test/exercises/*_test.rb', 'solutions/**/*.rb', '*.md',
         'LICENSE.txt'] +
      exercise_files).select do |file|
      File.file?(file)
    end
  end
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency 'minitest', '~> 5.16'
end
