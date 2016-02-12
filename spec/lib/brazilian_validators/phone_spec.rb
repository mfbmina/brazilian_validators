require 'spec_helper'

describe BrazilianValidators::Phone do
  let(:phone) { BrazilianValidators::Phone.new('(011) 99999-1231') }

  describe "#initialize" do
    it "should initialize @number" do
      expect(phone.instance_variable_get(:@number)).to_not be_nil
    end

    it "should initialize @area_code" do
      expect(phone.instance_variable_get(:@area_code)).to_not be_nil
    end

    it "should remove any non-digit from @number" do
      expect(phone.instance_variable_get(:@number)).to_not match(/\D/)
    end

    it "should remove any non-digit from @area_code" do
      expect(phone.instance_variable_get(:@area_code)).to_not match(/\D/)
    end

    it "should make @area_code have only 2 digits" do
      expect(phone.instance_variable_get(:@area_code).size).to eq(2)
    end
  end

  describe "#area_code" do
    it 'should return the initialized area_code' do
      expect(phone.area_code).to eq('11')
    end
  end

  describe "#area_code=" do
    it 'should set @area_code' do
      phone = BrazilianValidators::Phone.new
      phone.area_code = '11'
      expect(phone.area_code).to eq('11')
    end

    it "should make @area_code have only 2 digits" do
      phone = BrazilianValidators::Phone.new
      phone.area_code = '011'
      expect(phone.area_code).to eq('11')
    end
  end

  describe "#is_mobile?" do
    it "should return true when both validations are true" do
      allow(phone).to receive(:valid?).and_return(true)
      allow(phone).to receive(:valid_mobile?).and_return(true)
      expect(phone.is_mobile?).to be_truthy
    end

    it "should return false when is not valid" do
      allow(phone).to receive(:valid?).and_return(false)
      allow(phone).to receive(:valid_mobile?).and_return(true)
      expect(phone.is_mobile?).to be_falsey
    end

    it "should return false when is not a mobile" do
      allow(phone).to receive(:valid?).and_return(true)
      allow(phone).to receive(:valid_mobile?).and_return(false)
      expect(phone.is_mobile?).to be_falsey
    end
  end

  describe "#self.is_mobile?" do
    it "should return true when both validations are true" do
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid?).and_return(true)
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_mobile?).and_return(true)
      expect(BrazilianValidators::Phone.is_mobile?('')).to be_truthy
    end

    it "should return false when is not valid" do
      allow(phone).to receive(:valid?).and_return(false)
      allow(phone).to receive(:valid_mobile?).and_return(true)
      expect(BrazilianValidators::Phone.is_mobile?('')).to be_falsey
    end

    it "should return false when is not a mobile" do
      allow(BrazilianValidators::Phone).to receive(:valid?).and_return(true)
      allow(BrazilianValidators::Phone).to receive(:valid_mobile?).and_return(false)
      expect(BrazilianValidators::Phone.is_mobile?('')).to be_falsey
    end
  end

  describe "#number" do
    it 'should return the initialized number' do
      expect(phone.number).to eq('999991231')
    end
  end

  describe "#number=" do
    it 'should set @number' do
      phone = BrazilianValidators::Phone.new
      phone.number = '999991231'
      expect(phone.number).to eq('999991231')
    end
  end

  describe "#valid?" do
    it "should return true when both validations are true" do
      allow(phone).to receive(:valid_area_code?).and_return(true)
      allow(phone).to receive(:valid_number?).and_return(true)
      expect(phone.valid?).to be_truthy
    end

    it "should return false when area code is not valid" do
      allow(phone).to receive(:valid_area_code?).and_return(false)
      allow(phone).to receive(:valid_number?).and_return(true)
      expect(phone.valid?).to be_falsey
    end

    it "should return false when number is not valid" do
      allow(phone).to receive(:valid_area_code?).and_return(true)
      allow(phone).to receive(:valid_number?).and_return(false)
      expect(phone.valid?).to be_falsey
    end
  end

  describe "#self.valid?" do
    it "should return true when both validations are true" do
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_area_code?).and_return(true)
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_number?).and_return(true)
      expect(BrazilianValidators::Phone.valid?('')).to be_truthy
    end

    it "should return false when area code is not valid" do
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_area_code?).and_return(false)
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_number?).and_return(true)
      expect(BrazilianValidators::Phone.valid?('')).to be_falsey
    end

    it "should return false when number is not valid" do
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_area_code?).and_return(true)
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_number?).and_return(false)
      expect(BrazilianValidators::Phone.valid?('')).to be_falsey
    end
  end

  describe "-valid_area_code?" do
    it 'should not allow area_code with more than 2 digits' do
      phone.area_code = '111'
      expect(phone.send(:valid_area_code?)).to be_falsey
    end

    it 'should not allow area_code with less than 2 digits' do
      expect(BrazilianValidators::Phone.new('1').send(:valid_area_code?)).to be_falsey
    end

    it 'should not accept any code that starts with zero' do
      expect(BrazilianValidators::Phone.new('00').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('01').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('02').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('03').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('04').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('05').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('06').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('07').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('08').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('09').send(:valid_area_code?)).to be_falsey
    end

    it "should not accept codes that end with zero" do
      expect(BrazilianValidators::Phone.new('10').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('20').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('30').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('40').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('50').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('60').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('70').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('80').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('90').send(:valid_area_code?)).to be_falsey
    end

    it "should accept all codes that starts with 1" do
      expect(BrazilianValidators::Phone.new('11').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('12').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('13').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('14').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('15').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('16').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('17').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('18').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('19').send(:valid_area_code?)).to be_truthy
    end

    it "should accept some codes that starts with 2" do
      expect(BrazilianValidators::Phone.new('21').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('22').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('23').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('24').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('25').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('26').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('27').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('28').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('29').send(:valid_area_code?)).to be_falsey
    end

    it "should accept some codes that starts with 3" do
      expect(BrazilianValidators::Phone.new('31').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('32').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('33').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('34').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('35').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('36').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('37').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('38').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('39').send(:valid_area_code?)).to be_falsey
    end

    it "should accept some codes that starts with 4" do
      expect(BrazilianValidators::Phone.new('41').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('42').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('43').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('44').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('45').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('46').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('47').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('48').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('49').send(:valid_area_code?)).to be_truthy
    end

    it "should accept some codes that starts with 5" do
      expect(BrazilianValidators::Phone.new('51').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('52').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('53').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('54').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('55').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('56').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('57').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('58').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('59').send(:valid_area_code?)).to be_falsey
    end

    it "should accept all codes that starts with 6" do
      expect(BrazilianValidators::Phone.new('61').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('62').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('63').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('64').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('65').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('66').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('67').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('68').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('69').send(:valid_area_code?)).to be_truthy
    end

    it "should accept some codes that starts with 7" do
      expect(BrazilianValidators::Phone.new('71').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('72').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('73').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('74').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('75').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('76').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('77').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('78').send(:valid_area_code?)).to be_falsey
      expect(BrazilianValidators::Phone.new('79').send(:valid_area_code?)).to be_truthy
    end

    it "should accept all codes that starts with 8" do
      expect(BrazilianValidators::Phone.new('81').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('82').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('83').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('84').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('85').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('86').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('87').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('88').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('89').send(:valid_area_code?)).to be_truthy
    end

    it "should accept all codes that starts with 9" do
      expect(BrazilianValidators::Phone.new('91').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('92').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('93').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('94').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('95').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('96').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('97').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('98').send(:valid_area_code?)).to be_truthy
      expect(BrazilianValidators::Phone.new('99').send(:valid_area_code?)).to be_truthy
    end
  end

  describe '-valid_mobile?' do
    let(:phone) { BrazilianValidators::Phone.new }

    it 'should return false when number have more than 9 digits' do
      phone.number = '1234567890'
      expect(phone.send(:valid_mobile?)).to be_falsey
    end

    it 'should return false when number have less than 8 digits' do
      phone.number = '1234567'
      expect(phone.send(:valid_mobile?)).to be_falsey
    end

    it 'should return false when number does not start with a 7, 8 or 9' do
      expect(BrazilianValidators::Phone.new('11199999999').send(:valid_mobile?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11299999999').send(:valid_mobile?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11399999999').send(:valid_mobile?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11499999999').send(:valid_mobile?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11599999999').send(:valid_mobile?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11699999999').send(:valid_mobile?)).to be_falsey
    end


    context 'when number have 9 digits' do
      it 'should not have area code starting with a 4, 5 or 6' do
        expect(BrazilianValidators::Phone.new('11999999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('21999999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('31999999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('41999999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('51999999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('61999999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('71999999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('81999999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('91999999999').send(:valid_mobile?)).to be_truthy
      end

      it 'should not start with a 8' do
        expect(BrazilianValidators::Phone.new('11899999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('21899999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('31899999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('71899999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('81899999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('91899999999').send(:valid_mobile?)).to be_falsey
      end

      it 'should not start with a 7' do
        expect(BrazilianValidators::Phone.new('11799999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('21799999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('31799999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('71799999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('81799999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('91799999999').send(:valid_mobile?)).to be_falsey
      end
    end

    context 'when number have 8 digits' do
      it 'should allow number starting with 70 if area code is equal to 1x, 21, 22 or 24' do
        expect(BrazilianValidators::Phone.new('1170999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1270999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1370999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1470999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1570999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1670999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1770999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1870999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1970999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2170999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2270999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2470999999').send(:valid_mobile?)).to be_truthy
      end

      it 'should allow number starting with 77 if area code is equal to 1x, 21, 22, 24, 31, 34 or 34' do
        expect(BrazilianValidators::Phone.new('1177999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1277999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1377999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1477999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1577999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1677999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1777999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1877999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1977999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2177999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2277999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2477999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('3177999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('3477999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('3477999999').send(:valid_mobile?)).to be_truthy
      end

      it 'should allow number starting with 78 if area code is equal to 1x, 21, 22, 24, 31, 34, 41, 44, 47, 48, 51,
          54, 61, 62, 65, 71, 73, 75, 81 or 85' do
        expect(BrazilianValidators::Phone.new('1178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1278999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1378999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1478999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1578999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1678999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1778999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1878999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1978999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2278999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('2478999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('3178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('3478999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('4178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('4478999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('4778999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('4878999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('5178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('5478999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('6178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('6278999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('6578999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('7178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('7378999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('7578999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('8178999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('8578999999').send(:valid_mobile?)).to be_truthy
      end

      it 'should allow number starting with 79 if area code is equal to 1x' do
        expect(BrazilianValidators::Phone.new('1179999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1279999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1379999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1479999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1579999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1679999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1779999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1879999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('1979999999').send(:valid_mobile?)).to be_truthy
      end

      it 'should have area code starting with a 4, 5 or 6 if number start with 9' do
        expect(BrazilianValidators::Phone.new('1199999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('2199999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('3199999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('4199999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('5199999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('6199999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('7199999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('8199999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('9199999999').send(:valid_mobile?)).to be_falsey
      end

      it 'should have area code starting with a 4, 5 or 6 if number start with 8' do
        expect(BrazilianValidators::Phone.new('1189999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('2189999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('3189999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('4189999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('5189999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('6189999999').send(:valid_mobile?)).to be_truthy
        expect(BrazilianValidators::Phone.new('7189999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('8189999999').send(:valid_mobile?)).to be_falsey
        expect(BrazilianValidators::Phone.new('9189999999').send(:valid_mobile?)).to be_falsey
      end
    end
  end

  describe '-valid_number?' do
    it 'should return true when are a valid mobile' do
      allow(phone).to receive(:valid_mobile?).and_return(true)
      expect(phone.send(:valid_number?)).to be_truthy
    end

    it 'should return true when are not a mobile but number start with 3, 4 or 5' do
      allow_any_instance_of(BrazilianValidators::Phone).to receive(:valid_mobile?).and_return(false)
      expect(BrazilianValidators::Phone.new('1119999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('1129999999').send(:valid?)).to be_truthy
      expect(BrazilianValidators::Phone.new('1139999999').send(:valid?)).to be_truthy
      expect(BrazilianValidators::Phone.new('1149999999').send(:valid?)).to be_truthy
      expect(BrazilianValidators::Phone.new('1159999999').send(:valid?)).to be_truthy
      expect(BrazilianValidators::Phone.new('1169999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('1179999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('1189999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('1199999999').send(:valid?)).to be_falsey
    end

    it 'should return false when number have more than 8 digits' do
      expect(BrazilianValidators::Phone.new('11299999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11399999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11499999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('11599999999').send(:valid?)).to be_falsey
    end

    it 'should return false when number have more than 7 digits' do
      expect(BrazilianValidators::Phone.new('112999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('113999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('114999999').send(:valid?)).to be_falsey
      expect(BrazilianValidators::Phone.new('115999999').send(:valid?)).to be_falsey
    end
  end

  describe '-remove_non_digits' do
    let(:phone) { BrazilianValidators::Phone.new('(011) 99999-9999assas') }

    it 'should return only digits' do
      expect(phone.number).to_not match(/\D/)
      expect(phone.area_code).to_not match(/\D/)
    end

    it 'should remove 0 when it start an area code' do
      expect(phone.area_code).to_not match(/\A0/)
    end
  end
end
