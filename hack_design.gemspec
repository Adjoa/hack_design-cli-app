
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hack_design/version"

Gem::Specification.new do |spec|
  spec.name          = "hack_design"
  spec.version       = HackDesign::VERSION
  spec.authors       = ["Adjoa"]
  spec.email         = ["adjoa.darien@gmail.com"]

  spec.summary       = %q{Hack Design Lessons}
  spec.description   = %q{A Ruby gem for accessing Hack Design lessons right from your command line.}
  spec.homepage      = "https://github.com/Adjoa/hack_design-cli-app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   << 'hack-design'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11.3"
  spec.add_development_dependency "nokogiri", "~> 1.8.1"
  spec.add_development_dependency "colorize", "~> 0.8.1"

end
