#Represent and Add Money using paisa 
class Money
  attr_reader :paisa
	def initialize(rupee,paisa)
    @paisa = rupee * 100 + paisa
	end

  def +(other_money)
    Money.new(0, paisa + other_money.paisa)
  end

  def - (other_money)
    Money.new(0, paisa - other_money.paisa)
  end

  def == other_money
    return false if other_money.nil?
    return false if self.class != other_money.class
    paisa == other_money.paisa
  end

  def hash
    paisa.hash
  end

  alias_method :eql?, :==
end