require_relative "lib/rspec_matchers/version"

Gem::Specification.new { |spec|
  spec.name = "rspec_matchers"
  spec.version = RspecMatchers::VERSION
  spec.authors = ["Wenoa Studio"]
  spec.email = ["desarrollo@wenoa.studio"]

  spec.summary = "Reusable RSpec matchers by Wenoa."
  spec.description = spec.summary
  spec.homepage = "https://github.com/wenoa/rspec-matchers"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 3.13"
}
