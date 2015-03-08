require "kleisli/contracts/version"
require "kleisli/validation"
require "contracts"

module Kleisli
  module Contracts
    include ::Contracts::Modules
    include ::Contracts

    def self.included(base)
      base.send(:include, ::Contracts)
    end

    class KContract < CallableClass
      def initialize(*inner_types)
        @inner_types = inner_types
      end
    end

    class MaybeOf < KContract
      def valid?(val)
        return false unless val.kind_of?(Kleisli::Maybe) &&
          @inner_types.size == 1
        inner_valid, _ = Contract.valid?(val.value, @inner_types.first)
        inner_valid || val.value.nil?
      end
    end

    class EitherOf < KContract
      def monad_valid(val)
        [Kleisli::Either::Left, Kleisli::Either::Right].
          include?(val.class)
      end
      def valid?(val)
        return false unless monad_valid(val) &&
          @inner_types.size == 2
        left_valid, _ = Contract.valid?(val.left, @inner_types.first)
        right_valid, _ = Contract.valid?(val.right, @inner_types.last)
        (val.left.nil? && right_valid) ||
        (val.right.nil? && left_valid)
      end
    end

    class ValidationOf < EitherOf
      def monad_valid(val)
        [Kleisli::Validation::Failure, Kleisli::Validation::Success].
          include?(val.class)
      end
    end
  end

end
