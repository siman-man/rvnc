# RVNC

Ruby Variable Name Collector.

RVNC collects variable name by using RubyVM::AST.

Argument names don't supported.

require 'RUBY_VERSION >= 2.6.0preview2'

## Installation

```ruby
gem 'rvnc'
```

Or install it yourself as:

```
$ gem install rvnc
```

## Usage

example.rb

```ruby
$global = 'global'
foo = 1
bar = 'hi'
BAZ = :baz
a, *b = [1, 2, 3]

class A
  @@test = 'test'

  def initialize
    @name = 'test'
  end
end
```

run `rvnc` command

```
$ rvnc example.rb
```

result

```
+---------+---------------+
| Name    | Location      |
+---------+---------------+
| $global | example.rb:1  |
| foo     | example.rb:2  |
| bar     | example.rb:3  |
| BAZ     | example.rb:4  |
| a       | example.rb:5  |
| b       | example.rb:5  |
| @@test  | example.rb:8  |
| @name   | example.rb:11 |
+---------+---------------+
```

If you specify a directory path, it collects recursively.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rvnc project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/siman-man/rvnc/blob/master/CODE_OF_CONDUCT.md).
