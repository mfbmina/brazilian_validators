module BrazilianValidators
  class Phone
    def initialize(number)
      @area_code = number[0] != '0' ? number.slice!(0..1) : number.slice!(1..2)
      @number = number
    end

    def area_code
      @area_code
    end

    def is_mobile?

    end

    def number
      @number
    end

    def self.is_mobile?
      true || false
    end

    def self.valid?
      true || false
    end

    def valid?
      valid_area_code?
    end

    private

    def valid_area_code?
      return false if @area_code.match(/[1-9]0|2[3569]|3[69]|45|5[26-9]|7[268]/)
      true
    end

    def valid_mobile?
      return false if @number.size > 9 || @number.size < 8
      return false if @number.size == 9 && @number[0] != 9 && @area_code.match(/\A[1-37-9]/)
      return false unless @number.match(/\A70/) && @area_code.match(/1[1-9]|2[124]/)
      return false unless @number.match(/\A77/) && @area_code.match(/1[1-9]|2[124]|3[147]/)
      return false unless @number.match(/\A78/) && @area_code.match(/1[1-9]|2[1247]|3[147]|4[1-478]|5[14]|6[125]|7[135]|8[15]/)
      return false unless @number.match(/\A79/) && @area_code.match(/1[1-9]/)
      return false unless @area_code[0].match(/4-6/)
      true
    end

    def valid_number?
      return valid_mobile? if @number.match(/\A[7-9]/)
    end

    def mobile_regexp
      # must see http://www.anatel.gov.br/setorregulado/index.php/plano-de-numeracao-brasileiro
    end
  end
end
