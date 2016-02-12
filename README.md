[![Build Status](https://travis-ci.org/mfbmina/brazilian_validators.svg?branch=master)](https://travis-ci.org/mfbmina/brazilian_validators)
# Brazilian Validators

It gives you a lot of useful validators for Brazillian documents or phones.

### Installation
You can run ```gem install 'brazilian_validators'```

But, if you wanna use Bundler just add ```gem 'brazilian_validators'``` into your Gemfile and run ```bundle install```.

### Usage
You can do:
```
phone = BrazilianValidators::Phone.new('11999999999')
phone.valid?
```

or just:

```
BrazilianValidators::Phone.valid?('11999999999')
```

You can check if it is an mobile number, like:
```
phone = BrazilianValidators::Phone.new('11999999999')
phone.is_mobile?
```

or:

```
BrazilianValidators::Phone.is_mobile?('11999999999')
```

### Tips
It will remove any non-digit from phone number and it will remove zeros if it starts the number.

### To-Do
Features that are coming:
* CPF validation
* CNPJ validation
* CEP validation
* ActiveRecord custom validations

### Contributing
If you wanna improve something or create new features,:fell free for:
* Forking this project
* Create a new pull request

Or just:
* Create a new issue

### Mainteners
* [@mfbmina](www.github.com/mfbmina) - Matheus Mina
