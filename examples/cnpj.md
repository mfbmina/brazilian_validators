For CNPJ you can do:
```
cnpj = BrazilianValidators::Cnpj.new('73.538.343/0001-88')
cnpj.valid?
```

or just:

```
BrazilianValidators::Cnpj.valid?('73.538.343/0001-88')
```

If you use Rails or ActiveModel, maybe you wanna some validators, so add to your model:
``` validates :field_name, cnpj: true ```

It will allow two CNPJ formats: XX.XXX.XXX/XXXX-XX or YYYYYYYYYYYYYY.
