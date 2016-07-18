require 'yaml'

YAML.load("--foo")
Yaml.dump("foo")
{ :a => 'b' }.to_yaml