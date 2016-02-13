require 'spec_helper'

describe BrazilianValidators::Cnpj do
  let(:cnpj) { BrazilianValidators::Cnpj.new('48.687.697/0001-47') }

  describe "#initialize" do
    it "should initialize @digits" do
      expect(cnpj.instance_variable_get(:@digits)).to eq("486876970001")
    end

    it "should initialize @first_digit_checker" do
      expect(cnpj.instance_variable_get(:@first_digit_checker)).to eq("4")
    end

    it "should initialize @second_digit_checker" do
      expect(cnpj.instance_variable_get(:@second_digit_checker)).to eq("7")
    end

    it "should allow only digits" do
      expect{ BrazilianValidators::Cnpj.new('48687697000147') }.to_not raise_error
    end

    it "should allow format with digits and dash" do
      expect{ BrazilianValidators::Cnpj.new('48.687.697/0001-47') }.to_not raise_error
    end

    it "should not allow unexpected format" do
      expect{ BrazilianValidators::Cnpj.new('48.687.697/00:ds22101-47') }.to raise_error
    end
  end

  describe '#valid?' do
    it 'should return true when check digits are equal' do
      expect(cnpj.valid?).to be_truthy
    end

    it 'should return false when first check digit are not equal' do
      allow(cnpj).to receive(:first_check_digit).and_return(9)
      expect(cnpj.valid?).to be_falsey
    end

    it 'should return false when second check digit are not equal' do
      allow(cnpj).to receive(:second_check_digit).and_return(9)
      expect(cnpj.valid?).to be_falsey
    end
  end

  describe '#self.valid?' do
    it 'should return true when check digits are equal' do
      expect(BrazilianValidators::Cnpj.valid?('48.687.697/0001-47')).to be_truthy
    end

    it 'should return false when first check digit are not equal' do
      allow_any_instance_of(BrazilianValidators::Cnpj).to receive(:first_check_digit).and_return(9)
      expect(BrazilianValidators::Cnpj.valid?('48.687.697/0001-47')).to be_falsey
    end

    it 'should return false when second check digit are not equal' do
      allow_any_instance_of(BrazilianValidators::Cnpj).to receive(:second_check_digit).and_return(9)
      expect(BrazilianValidators::Cnpj.valid?('48.687.697/0001-47')).to be_falsey
    end
  end
end
