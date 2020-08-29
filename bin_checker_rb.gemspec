require_relative 'lib/bin_checker_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "bin_checker_rb"
  spec.version       = BinCheckerRb::VERSION
  spec.authors       = ["Prompt API"]
  spec.email         = ["hello@promptapi.com"]

  spec.summary       = %q{Ruby wrapper for Prompt API's BIN Checker API}
  spec.homepage      = "https://github.com/promptapi/bin_checker_rb"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/promptapi/bin_checker_rb"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'faraday', '~> 1.0', '>= 1.0.1'
end
