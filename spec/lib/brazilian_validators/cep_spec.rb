require 'spec_helper'

describe BrazilianValidators::Cep do
  let(:cep){ BrazilianValidators::Cep.new("01100-100") }

  describe "#initialize" do
    it "should initialize @value" do
      expect(cep.instance_variable_get(:@value)).to eq("01100-100")
    end
  end

  describe "#valid?" do
    it "shoud return true when match cep format" do
      expect(cep.valid?).to be_truthy
    end

    it "shoud return false when not match cep format" do
      cep = BrazilianValidators::Cep.new("001100-100")
      expect(cep.valid?).to be_falsey
    end

    it "shoud return false when not match cep format" do
      cep = BrazilianValidators::Cep.new("01100-0100")
      expect(cep.valid?).to be_falsey
    end

    it "shoud return false when not match cep format" do
      cep = BrazilianValidators::Cep.new("01100100")
      expect(cep.valid?).to be_falsey
    end
  end

  describe "#self.valid?" do
    it "shoud return true when match cep format" do
      expect(BrazilianValidators::Cep.valid?("01100-100")).to be_truthy
    end

    it "shoud return false when not match cep format" do
      expect(BrazilianValidators::Cep.valid?("001100-100")).to be_falsey
    end

    it "shoud return false when not match cep format" do
      expect(BrazilianValidators::Cep.valid?("00110-0100")).to be_falsey
    end

    it "shoud return false when not match cep format" do
      expect(BrazilianValidators::Cep.valid?("01100100")).to be_falsey
    end
  end
end
