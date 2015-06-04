#Defines attributes of Money in INR 
class Money
  attr_reader :amount
	def initialize(rupee, paisa)
    amount = rupee * 100 + paisa
    if amount < 0
      raise 'Negative Money value entered' 
    else
      @amount = amount
    end
	end

  def +(other_money)
    if self.class == other_money.class
      Money.new(0, amount + other_money.amount)
    else
      raise TypeError.new('Cannot add money with #{other_money.class}'), caller
    end
  end

  def -(other_money)
    if self.class == other_money.class
      Money.new(0, amount - other_money.amount)
    else
      raise TypeError.new('Cannot subtract money with #{other_money.class}'), caller
    end
  end

  def ==(other_money)
    return false if self.class != other_money.class
    amount == other_money.amount
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

  alias_method :eql?, :==
end