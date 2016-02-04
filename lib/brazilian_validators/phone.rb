class BrazilianValidators
  class Phone
    def initialize(number = '')
      number = remove_non_digits(number)
      @area_code = number.slice!(0..1)
      @number = number
    end

    def area_code
      @area_code
    end

    def area_code=(area_code)
      area_code = remove_non_digits(area_code)
      @area_code = area_code
    end

    def is_mobile?
      valid? && valid_mobile?
    end

    def number
      @number
    end

    def number=(number)
      number = remove_non_digits(number)
      @number = number
    end

    def self.is_mobile?(number)
      phone = new(number)
      phone.is_mobile?
    end

    def self.valid?(number)
      phone = new(number)
      phone.valid?
    end

    def valid?
      valid_area_code? && valid_number?
    end

    private

    def valid_area_code?
      return false unless @area_code.size == 2
      return false if @area_code.match(/\A0|[1-9]0|2[3569]|3[69]|45|5[26-9]|7[268]/)
      true
    end

    def valid_mobile?
      return false if @number.match(/\A[0-6]/)
      return true if @number.size == 9 && @number.match(/\A9/) && @area_code.match(/\A[0-37-9]/)
      if @number.size == 8
        return true if @number.match(/\A70/) && @area_code.match(/1[1-9]|2[124]/)
        return true if @number.match(/\A77/) && @area_code.match(/1[1-9]|2[124]|3[147]/)
        return true if @number.match(/\A78/) && @area_code.match(/1[1-9]|2[1247]|3[147]|4[1-478]|5[14]|6[125]|7[135]|8[15]/)
        return true if @number.match(/\A79/) && @area_code.match(/1[1-9]/)
        return true if @area_code.match(/\A[456]/) && @number.match(/\A[89]/)
      end
      false
    end

    def valid_number?
      valid_mobile? || (@number.match(/\A[2-5]/) && @number.size == 8)
    end

    def remove_non_digits(string)
      string.gsub!(/\D/, "")
      string.gsub!(/\A0/, "")
      string
    end
  end
end
