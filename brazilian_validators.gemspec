Gem::Specification.new do |s|
  s.name = "brazilian_validators"
  s.version = "1.4.0"
  s.date = "2016-02-15"
  s.summary = "Brazillian Validators, gives you some validations!"
  s.description = "It gives you a lot of useful validators for Brazillian documents or phones. Allow ActiveModel validations"
  s.authors = ["Matheus Mina"]
  s.email = "mfbmina@gmail.com"
  s.homepage = "https://github.com/mfbmina/brazilian_validators"
  s.license = "MIT"
  s.required_ruby_version = '>= 2.1.2'

  s.files = [
    "lib/brazilian_validators.rb",
    "lib/brazilian_validators/phone.rb",
    "lib/brazilian_validators/cpf.rb",
    "lib/brazilian_validators/cnpj.rb",
    "lib/brazilian_validators/cep.rb",
    "lib/brazilian_validators/activemodel/cep_validator.rb"
  ]

  s.add_runtime_dependency "activemodel", "~> 4.2.5", ">= 4.2.5"

  s.add_development_dependency "pry", '~> 0.10.3', '>= 0.10.3'
  s.add_development_dependency "rspec", '~> 3.4.0', '>= 3.4.0'
end
