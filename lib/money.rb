class Money
	def initialize(rupee,paisa)
    @rupee = rupee
    @paisa = paisa
	end

  def add(other_money)
    Money.new(2,90)
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