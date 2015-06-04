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

  def operation(operator, other_money_object)
    if self.class == other_money_object.class
      result =  Money.new(0, amount + other_money_object.amount) if operator == 'add'
      result = Money.new(0, amount - other_money_object.amount) if operator == 'subtract'
    else
      raise TypeError.new('Cannot #{operator} money with #{other_money.class}'), caller
    end
    result
  end

  def +(other_money)
    operation('add', other_money)
  end

  def -(other_money)
    operation('subtract', other_money)
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