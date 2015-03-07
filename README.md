# Kleisli::Contracts

Provides the following [Contracts](https://github.com/egonSchiele/contracts.ruby)
for monads provided by the [Kleisli](https://github.com/txus/kleisli) gem:

```ruby
MaybeOf[SomeType]
EitherOf[LeftType, RightType]
ValidationOf[FailureType, SuccessType]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kleisli-contracts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kleisli-contracts

You can then include it in your class as follows:

```ruby
class Something
  include Kleisli::Contracts
end
```

This will provide you with all the mixins from the Contracts gem, as well as
the Kleisli specific Contracts defined in this one.

## Usage

Use of Contracts is well documented [here](http://egonschiele.github.io/contracts.ruby/)

Use of Maybe and Either are well documented [here](http://blog.txus.io/kleisli/)

Use of Validation is well documented [here](https://github.com/beezee/kleisli-validation)

Example use can be seen in the [tests](https://github.com/beezee/kleisli-contracts/blob/master/test/kleisli/contracts_test.rb)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kleisli-contracts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
