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

## Usage

Use of Contracts is well documented [here](http://egonschiele.github.io/contracts.ruby/)

Use of Maybe and Either are well documented [here](http://blog.txus.io/kleisli/)

Use of Validation is well documented [here](https://github.com/beezee/kleisli-validation)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kleisli-contracts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
