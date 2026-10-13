# frozen_string_literal: true

require_relative 'lib/rubylings/version'

Gem::Specification.new do |s|
  s.name = 'rkoans'
  s.version = Rubylings::VERSION
  s.authors = ['Theo Melo']
  s.email = ['9499829+theomelo@users.noreply.github.com']

  s.summary = 'Ruby and Rails challenges'
  s.description = 'Ruby and Rails challenges for learning and practicing'
  s.homepage = 'https://github.com/theomelo/rubylings'
  s.license = 'MIT'
  s.required_ruby_version = '>= 4.0.7'
  s.metadata['allowed_push_host'] = 'https://rubygems.org'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/theomelo/rubylings'
  s.metadata['changelog_uri'] = 'https://github.com/theomelo/rubylings/blob/main/CHANGELOG.md'
  s.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  s.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .rubocop.yml])
    end
  end
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
end
