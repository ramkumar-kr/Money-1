require 'spec_helper'

describe Money do
  it "two money objects with same value are equal" do
    money1 = Money.new(1,45) 
    money2 = Money.new(1,45)
    expect(money1).to eq(money2)
  end

  it "money objects is not same as nil" do
    money1 = Money.new(1,45) 
    expect(money1).not_to eq(nil)
  end

  it "money objects is not same as any other object type" do
    money1 = Money.new(1,45) 
    expect(money1).not_to eq(Object.new)
  end

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

  it "two money objects with different value are equal" do
    money1 = Money.new(0,100) 
    money2 = Money.new(1,0)
    expect(money1).to eq(money2)
  end


  it "two money objects with same value have same hash" do
    money1 = Money.new(1,45) 
    money2 = Money.new(1,45)
    expect(money1.hash).to eq(money2.hash)
  end


	it "two money values are added correctly" do
		money1 = Money.new(1,45) 
		money2 = Money.new(1,45)
		money3 = Money.new(2,90)
		expect(money1.add(money2)).to eq(money3)
	end

  it "two money values are added correctly" do
    money1 = Money.new(1,50) 
    money2 = Money.new(1,45)
    money3 = Money.new(2,90)
    expect(money1.add(money2)).not_to eq(money3)
  end

  it "two money values with paisa > 100 are added correctly" do
    money1 = Money.new(0,0) 
    money2 = Money.new(0,271)
    money3 = Money.new(2,71)
    expect(money1.add(money2)).to eq(money3)
  end
end 