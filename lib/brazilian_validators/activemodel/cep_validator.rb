require 'active_model'

class CepValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not a cep") unless BrazilianValidators::Cep.valid?(value)
  end
end
