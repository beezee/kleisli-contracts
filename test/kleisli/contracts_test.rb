require 'test_helper'

class ContractsTest < Minitest::Test
  include Kleisli::Contracts

  Contract MaybeOf[MaybeOf[Num]] => MaybeOf[Num]
  def maybe_add(m_int)
    m_int >-> x { x.fmap { |y| y + 1 } }
  end

  def test_maybe
    assert_equal(Some(4), maybe_add(Some(Some(3))))
    assert_raises(ContractError) { maybe_add(Some(Some("b"))) }
  end

  Contract EitherOf[String, String] => EitherOf[String, Num]
  def either_to_i(either_string)
    either_string >-> x { x.to_i > 0 ? Right(x.to_i) : Left("sorry") }
  end

  def test_either
    assert_equal(Right(3), either_to_i(Right("3")))
    assert_equal(Left("nope"), either_to_i(Left("nope")))
    assert_equal(Left("sorry"), either_to_i(Right("fif")))
    assert_raises(ContractError) { either_to_i(Right(3)) }
    assert_raises(ContractError) { either_to_i(Left(5)) }
  end

  VNum = ValidationOf[ArrayOf[String], Num]
  Contract VNum, VNum => VNum
  def validated_sum(n1, n2)
    Success(-> x, y { x + y }) * n1 * n2
  end

  def test_validation
    assert_equal(Success(3), validated_sum(Success(1), Success(2)))
    assert_equal(Failure(["nope"]), validated_sum(Success(2), Failure(["nope"])))
    assert_equal(Failure(["sorry", "nope"]), validated_sum(Failure(["sorry"]), Failure(["nope"])))
    assert_raises(ContractError) { validated_sum(Success(3), Failure("missing array")) }
    assert_raises(ContractError) { validated_sum(Success("3"), Success(4)) }
  end
end
