For CPF you can do:
```
cpf = BrazilianValidators::Cpf.new('12345678909')
cpf.valid?
```

or just:

```
BrazilianValidators::Cpf.valid?('12345678909')
```

It will allow two CPF formats: XXX.XXX.XXX-XX or YYYYYYYYYYY.
