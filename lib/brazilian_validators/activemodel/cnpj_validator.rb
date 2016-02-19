require 'active_model'

class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      record.errors[attribute] << (options[:message] || "is not a cnpj") unless BrazilianValidators::Cnpj.valid?(value)
    rescue StandardError => e
      record.errors[attribute] << (options[:message] || "is not a cnpj")
    end
  end
end
