require 'spec_helper'

describe Money do
  it "two money objects with same value are equal" do
    money1 = Money.new(1,45) 
    money2 = Money.new(1,45)
    expect(money1).to eq(money2)
  end

  it "two money objects with different value are not equal" do
    money1 = Money.new(1,45) 
    money2 = Money.new(1,50)
    expect(money1).not_to eq(money2)
  end

  it "two money objects with same value have same hash" do
    money1 = Money.new(1,45) 
    money2 = Money.new(1,45)
    expect(money1.hash).to eq(money2.hash)
  end


	it "takes diagonally opp points of a Rectangle and checks if perimeter is correct" do
		money1 = Money.new(1,45) 
		money2 = Money.new(1,45)
		money3 = Money.new(2,90)
		expect(money1.add(money2)).to eq(money3)
	end
end 