# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'junkyard/version'

get_executables = lambda do |files|
  files.grep(%r{^exe/}) { |f| File.basename(f) }
end

get_files = lambda do
  `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
end

Gem::Specification.new do |spec|
  spec.name          = 'junkyard'
  spec.version       = Junkyard::VERSION
  spec.authors       = ['Kevin Primm']
  spec.email         = ['kfprimm@gmail.com']

  spec.summary       = 'Junkyard Brawl, the card game.'
  spec.description   = [
    'This is the core library for creating stateful game instances ',
    'and handling logic.'
  ]
  spec.homepage      = 'https://github.com/gfax/junkyard'
  spec.license       = 'MIT'

  spec.files = get_files.call
  spec.bindir        = 'exe'
  spec.executables   = get_executables.call(spec.files)
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-cucumber'
  spec.add_development_dependency 'coveralls'
end
