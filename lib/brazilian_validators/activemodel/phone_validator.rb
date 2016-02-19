require 'active_model'

class MobileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not a mobile") unless BrazilianValidators::Phone.is_mobile?(value)
  end
end
