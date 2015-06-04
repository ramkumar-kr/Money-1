#Defines attributes of Money in INR 
class Money
  include Comparable
  attr_reader :amount
	def initialize(rupee, paisa)
    amount = rupee * 100 + paisa
    if amount < 0
      raise 'Negative Money value entered' 
    else
      @amount = amount
    end
	end

  def operate(other_money, &operation)
    if self.class == other_money.class
      result = operation.call()
    else
      raise TypeError.new("Cannot operate money with #{other_money.class}")
    end
    result
  end

  def +(other_money)
    operate(other_money) do 
      Money.new(0, amount + other_money.amount)
    end
  end

  def -(other_money)
    operate(other_money) do 
      Money.new(0, amount - other_money.amount)
    end
  end

  def hash
    amount.hash
  end

  def to_s
    rupee = (amount.abs / 100).to_i
    residual_amount = (amount.abs % 100).to_i

    pretty_string = (rupee != 0 ? "Rupees #{rupee} " : "")
    pretty_string = pretty_string + (residual_amount != 0 ? "Paisa #{residual_amount}" : "")
    pretty_string.strip
  end

  def <=>(other_money)
    raise ArgumentError if self.class != other_money.class
    amount <=> other_money.amount
  end

  alias_method :eql?, :==
end