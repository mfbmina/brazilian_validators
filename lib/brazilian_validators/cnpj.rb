class BrazilianValidators
  class Cnpj
    def initialize(document)
      raise(StandardError, "Not a valid cnpj format") unless document.match(/[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}\-[0-9]{2}|\d{14}/)
      document.gsub!(/\D/, "")
      @digits = document[0..11]
      @first_digit_checker = document[12]
      @second_digit_checker = document[13]
    end

    def valid?
      first_digit = first_check_digit
      second_digit = second_check_digit(first_digit)
      first_digit == @first_digit_checker.to_i && second_digit == @second_digit_checker.to_i
    end

    def self.valid?(document)
      BrazilianValidators::Cnpj.new(document).valid?
    end

    private

    def first_check_digit
      array = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      sum = sum_of_digits(@digits, array)
      remainder = sum % 11
      remainder < 2 ? 0 : (11 - remainder)
    end

    def second_check_digit(first_digit)
      array = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      sum = sum_of_digits(@digits + first_digit.to_s, array)
      remainder = sum % 11
      remainder < 2 ? 0 : (11 - remainder)
    end

    def sum_of_digits(digits, array)
      sum = 0
      digits.split("").each_index do |i|
        sum += digits[i].to_i * array[i]
      end
      sum
    end
  end
end
