Gem::Specification.new do |spec|
  spec.name          = "ruby_lunardate"
  spec.version       = "0.0.1"
  spec.default_executable = "ruby_lunardate"

  spec.authors       = ["sunsidew"]
  spec.email         = %q{sunsidew.yjw@gmail.com}
  spec.date          = %q{2015-09-08}

  spec.summary       = %q{Korean Lunar Calendar Library}
  spec.description   = spec.summary
  spec.homepage      = %q{https://github.com/sunsidew/ruby_lunardate}
  spec.licenses      = %w(BSD)

  spec.files         = ["lib/ruby_lunardate.rb"]
  spec.test_files    = ["test/test_ruby_lunardate.rb"]
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  end
end
