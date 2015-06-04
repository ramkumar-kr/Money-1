require 'spec_helper'

describe Money do

  context "Equality" do
    it "two money objects with same value are equal" do
      money1 = Money.new(1,45) 
      money2 = Money.new(1,45)
      expect(money1).to eq(money2)
    end

    it "money object not == nil" do
      money1 = Money.new(1,45) 
      expect(money1).not_to eq(nil)
    end

    it "same money object is equal" do
      money1 = Money.new(1,45) 
      expect(money1).to eq(money1)
    end

    it "money objects not == other object type" do
      money1 = Money.new(1,45) 
      expect(money1).not_to eq(Object.new)
    end

    it "two money objects with different value are not equal" do
      money1 = Money.new(1,45) 
      money2 = Money.new(1,50)
      expect(money1).not_to eq(money2)
    end

    it "same money value with different rs/paisa representation are equal" do
      money1 = Money.new(0,100) 
      money2 = Money.new(1,0)
      expect(money1).to eq(money2)
    end


    it "two money objects with same value have same hash" do
      money1 = Money.new(1,45) 
      money2 = Money.new(1,45)
      expect(money1.hash).to eq(money2.hash)
    end
  end

  context "Addition" do

  	it "two money values are added correctly" do
  		money1 = Money.new(1,45) 
  		money2 = Money.new(1,45)
  		money3 = Money.new(2,90)
  		expect(money1 + money2).to eq(money3)
  	end

    it "two money values are added correctly" do
      money1 = Money.new(1,50) 
      money2 = Money.new(1,45)
      money3 = Money.new(2,90)
      expect(money1 + money2 ).not_to eq(money3)
    end

    it "two money values with paisa > 100 are added correctly" do
      money1 = Money.new(0,0) 
      money2 = Money.new(0,271)
      money3 = Money.new(2,71)
      expect(money1 + money2).to eq(money3)
    end

    it "when added to object of other class return TypeError" do
      money1 = Money.new(0,0)
      expect{ money1 + Object.new }.to raise_error(TypeError)
    end
  end

  context "subtraction" do 
    it "is subtraction correctly calculated for 2 & 56   and   2 & 56" do
      money1 = Money.new(2,56)
      money2 = Money.new(2,56)
      money3 = Money.new(0,0)
      expect(money1 - money2).to eq(money3)
    end

    it "subtraction raises an exception when we subtract 3,266 from 2,66" do
      money1 = Money.new(2,66)
      money2 = Money.new(3,266)
      expect{money1 - money2}.to raise_error("Negative Money value entered")
    end

    it "when subtracted with object of other class return TypeError" do
      money1 = Money.new(0,0)
      expect{ money1 - Object.new }.to raise_error(TypeError, /Cannot operate money with*/)
    end
  end

  context "Pretty Printing" do
    it "is to_s of Money(2,30) Rupees : 2  Paisa : 30" do
      expect(Money.new(2,30).to_s).to eq("Rupees 2 Paisa 30")
    end

    it "is to_s of Money(-2,30) Rupees : -2 , Paisa : 30 " do
      expect{ Money.new(-2,30).to_s }.to raise_error
    end

    it "is to_s of Money(0,10) Paisa 10" do
      expect(Money.new(0,10).to_s).to eq("Paisa 10")
    end

    it "is to_s of Money(10,0) Rupees 10" do
      expect(Money.new(10,0).to_s).to eq("Rupees 10")
    end

    it "is to_s of Money(-10,-10) Rupees 10" do
      expect{ Money.new(-10,-10).to_s }.to raise_error
    end
  end

  context "Negative Money Errors" do
    it "should throw an exception if input argument is negative" do
      expect { Money.new(-10,-10) }.to raise_error
    end
  end  
 end 