lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'with_retry/version'

Gem::Specification.new do |spec|
  spec.name          = "with_retry"
  spec.version       = WithRetry::VERSION
  spec.authors       = ["Tsukuru Tanimichi"]
  spec.email         = ["ttanimichi@hotmail.com"]

  spec.summary       = "Kernel#with_retry"
  spec.homepage      = "https://github.com/ttanimichi/with_retry"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
