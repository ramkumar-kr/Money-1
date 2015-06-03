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

  def to_s
    rupee = (paisa.abs / 100).to_i
    residual_paisa = (paisa.abs % 100).to_i

    pretty_string = (rupee != 0 ? "Rupees #{rupee} " : "")
    pretty_string = pretty_string + (residual_paisa != 0 ? "Paisa #{residual_paisa}" : "")
    pretty_string = (paisa < 0 ? "- " : "") + pretty_string
    pretty_string.strip
  end

  alias_method :eql?, :==
end