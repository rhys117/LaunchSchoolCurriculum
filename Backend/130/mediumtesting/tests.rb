require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 50

    assert_equal 30, register.change(transaction)
  end

  def test_give_reciept
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    item_cost = 20
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_reciept(transaction)
    end
  end
end

class TransactionTest < Minitest::test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal transaction.amount_paid, 30
  end
end