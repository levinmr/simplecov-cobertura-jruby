# simplecov-cobertura-jruby

Produces [Cobertura](http://cobertura.sourceforge.net/) formatted XML from [SimpleCov](https://github.com/colszowka/simplecov).

Output can be consumed by the [Jenkins Cobertura Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Cobertura+Plugin) for easy
coverage visualization.

## Note

This gem was forked from [simplecov-cobertura](https://github.com/dashingrocket/simplecov-cobertura).  Please refer to that gem for use with C Extension Ruby Versions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov-cobertura-jruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecov-cobertura-jruby

## Usage

```ruby
require 'simplecov-cobertura-jruby'

SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
```

## Known Limitations
* No support for branch coverage

## Contributing

1. Fork it ( https://github.com/levinmr/simplecov-cobertura-jruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
Copyright 2014 Dashing Rocket, Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
