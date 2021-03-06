Gem::Specification.new do |spec|
  spec.name          = "ruby_lunardate"
  spec.version       = "0.1.1"
  spec.default_executable = "ruby_lunardate"

  spec.authors       = ["sunsidew"]
  spec.email         = %q{sunsidew.yjw@gmail.com}

  spec.summary       = %q{Korean Lunar/Solar Calendar Library}
  spec.description   = %q{Korean lunar date, solar date two-way convert library }
  spec.homepage      = %q{https://github.com/sunsidew/ruby_lunardate}
  spec.licenses      = %w(BSD)

  spec.files         = ["lib/ruby_lunardate.rb"]
  spec.test_files    = ["test/test_ruby_lunardate.rb"]
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  end
end
