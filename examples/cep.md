For CEP you can do:
```
cep = BrazilianValidators::Cep.new('01100-100')
cep.valid?
```

or just:

```
BrazilianValidators::Cep.valid?('01100-100')
```

If you use Rails or ActiveModel, maybe you wanna some validators, so add to your model:
``` validates :field_name, cep: true ```

It will allow only this format XXXXX-XXX. Please note that this gem not check what address belongs to that CEP.
