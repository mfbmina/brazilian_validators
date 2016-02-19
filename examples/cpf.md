For CPF you can do:
```
cpf = BrazilianValidators::Cpf.new('12345678909')
cpf.valid?
```

or just:

```
BrazilianValidators::Cpf.valid?('12345678909')
```

If you use Rails or ActiveModel, maybe you wanna some validators, so add to your model:
``` validates :field_name, cpf: true ```

It will allow two CPF formats: XXX.XXX.XXX-XX or YYYYYYYYYYY.
