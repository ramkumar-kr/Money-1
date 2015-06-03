#Represent and Add Money using Rs and paisa 
class Money
	def initialize(rupee,paisa)
    @rupee = rupee + (paisa/100).to_i
    @paisa = (paisa % 100).to_i
	end

  def add(other_money)
    Money.new(0, to_paise + other_money.to_paise)
  end

  def == other_money
    return false if other_money.nil?
    return false if self.class != other_money.class
    to_paise == other_money.to_paise
  end

  def to_paise
    @rupee * 100 + @paisa
  end

  def hash
    to_paise.hash
  end

  alias_method :eql?, :==

end