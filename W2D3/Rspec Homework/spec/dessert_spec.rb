require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    subject {Dessert.new("pastry", 30, chef)}

    it "sets a type" do
      expect(subject.type).to eq("pastry")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(30)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("pastry", "string", chef)}.to raise_error(ArgumentError)
    end
  end

  
  describe "#add_ingredient" do
    subject {Dessert.new("pastry", 30, chef)}

    before(:each) do  
      subject.add_ingredient("sugar")
    end

    it "adds an ingredient to the ingredients array" do
      expect(subject.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    subject {Dessert.new("pastry", 30, chef)}

    let(:ingredes) { ["sugar", "flour", "chocolate", "butter", "milk"] }
    
    before(:each) do 
      ingredes.each { |ingrede| subject.add_ingredient(ingrede) }
      subject.mix!
    end

    it "shuffles the ingredient array" do
      expect(subject.ingredients).not_to eq(ingredes)
    end
  end

  describe "#eat" do
  subject {Dessert.new("pastry", 30, chef)}

  before(:each) do
    subject.eat(5)
  end

    it "subtracts an amount from the quantity" do
      expect(subject.quantity).to eq(25)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(subject.eat(35)).to raise_error("not enough left!")
    end
  end

  describe "#serve" do
  subject {Dessert.new("pastry", 30, chef)}

    it "contains the titleized version of the chef's name" do
      expect(subject.serve).to include("has")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
