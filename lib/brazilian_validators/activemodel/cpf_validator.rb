require 'active_model'

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      record.errors[attribute] << (options[:message] || "is not a cpf") unless BrazilianValidators::Cpf.valid?(value)
    rescue StandardError => e
      record.errors[attribute] << (options[:message] || "is not a cpf")
    end
  end
end
