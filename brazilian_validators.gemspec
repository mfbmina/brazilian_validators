Gem::Specification.new do |s|
  s.name = "brazilian_validators"
  s.version = "1.0.1"
  s.date = "2016-01-23"
  s.summary = "Brazillian Validators, gives you some validations!"
  s.description = "It gives you a lot of useful validators for Brazillian documents or phones."
  s.authors = ["Matheus Mina"]
  s.email = "mfbmina@gmail.com"
  s.files = ["lib/brazilian_validators.rb", "lib/brazilian_validators/phone.rb"]
  s.homepage = "https://github.com/mfbmina/brazilian_validators"
  s.license = "MIT"

  s.add_development_dependency "pry", '~> 0.10.3'
  s.add_development_dependency "rspec", '~> 3.4.0'
end
