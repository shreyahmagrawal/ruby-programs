require 'yaml'
YAML.load("--foo")

YAML.dump("foo")
{:a => 'b'}.to_yaml