class BrazilianValidators
  class Cpf
    def initialize(document)
      raise(StandardError, "Not a valid cpf format") unless document.match(/[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}|\d{11}/)
      document.gsub!(/\D/, "")
      @digits = document[0..8]
      @first_digit_checker = document[9]
      @second_digit_checker = document[10]
    end

    def valid?
      first_digit = check_digit(@digits, 10)
      second_digit = check_digit(@digits + first_digit.to_s, 11)
      first_digit == @first_digit_checker.to_i && second_digit == @second_digit_checker.to_i
    end

    def self.valid?(document)
      BrazilianValidators::Cpf.new(document).valid?
    end

    private

    def check_digit(digits, multiplicator)
      sum = 0
      digits.split("").each do |v|
        sum += v.to_i * multiplicator
        multiplicator -= 1
      end
      remainder = sum % 11
      remainder < 2 ? 0 : (11 - remainder)
    end
  end
end
