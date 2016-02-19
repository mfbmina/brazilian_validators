require 'active_model'

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not a phone") unless BrazilianValidators::Phone.valid?(value)
  end
end
