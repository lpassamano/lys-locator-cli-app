Gem::Specification.new do |spec|
  spec.name          = "lys-locator"
  spec.version       = "0.0.0"
  spec.authors       = ["Leigh-Ayna Passamano"]
  spec.email         = ["leighayna.josele@gmail.com"]

  spec.summary       = "Local Yarn Store Locator"
  spec.description   = "Uses knitmap.com to provide details on yarn stores near a specific postalcode."
  spec.homepage      = "https://github.com/lpassamano/lys-locator-cli-app"
  spec.license       = "MIT"
  spec.files         = Dir["bin/lys-locator.rb"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "pry", "~> 0.10.4"

  spec.add_dependency "nokogiri", "~> 1.8.0", ">= 1.8.0"
  spec.add_dependency "open-uri-s3", "~> 1.6.0", ">= 1.6.0"
  spec.add_dependency "colorize", "~> 0.8.1", ">= 0.8.1"
  spec.add_dependency "terminal-table", "~> 1.8.0", ">= 1.8.0"
end
