class BrazilianValidators
  class Cep
    def initialize(string)
      @value = string
    end

    def valid?
      @value.match(/^[0-9]{5}\-[0-9]{3}$/) ? true : false
    end

    def self.valid?(string = '')
      BrazilianValidators::Cep.new(string).valid?
    end
  end
end
