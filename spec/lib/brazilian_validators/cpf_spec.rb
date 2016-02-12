require 'spec_helper'

describe BrazilianValidators::Cpf do
  let(:cpf) { BrazilianValidators::Cpf.new('55382921008') }

  describe "#initialize" do
    it "should initialize @digits" do
      expect(cpf.instance_variable_get(:@digits)).to eq("553829210")
    end

    it "should initialize @first_digit_checker" do
      expect(cpf.instance_variable_get(:@first_digit_checker)).to eq("0")
    end

    it "should initialize @second_digit_checker" do
      expect(cpf.instance_variable_get(:@second_digit_checker)).to eq("8")
    end

    it "should allow only digits" do
      expect{ BrazilianValidators::Cpf.new('55382921008') }.to_not raise_error
    end

    it "should allow format with digits and dash" do
      expect{ BrazilianValidators::Cpf.new('553.829.210-08') }.to_not raise_error
    end

    it "should not allow unexpected format" do
      expect{ BrazilianValidators::Cpf.new('553.829ffd.210-08') }.to raise_error
    end
  end

  describe '#valid?' do
    it 'should return true when check digits are equal' do
      expect(cpf.valid?).to be_truthy
    end

    it 'should return false when check digits are not equal' do
      allow(cpf).to receive(:check_digit).and_return(9, 7)
      expect(cpf.valid?).to be_falsey
    end
  end

  describe '#self.valid?' do
    it 'should return true when check digits are equal' do
      expect(BrazilianValidators::Cpf.valid?('55382921008')).to be_truthy
    end

    it 'should return false when check digits are not equal' do
      allow_any_instance_of(BrazilianValidators::Cpf).to receive(:check_digit).and_return(9, 7)
      expect(BrazilianValidators::Cpf.valid?('55382921008')).to be_falsey
    end
  end
end
