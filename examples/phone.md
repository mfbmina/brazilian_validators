For phone you can do:
```
phone = BrazilianValidators::Phone.new('11999999999')
phone.valid?
```

or just:

```
BrazilianValidators::Phone.valid?('11999999999')
```

You can check if it is a mobile number, like:
```
phone = BrazilianValidators::Phone.new('11999999999')
phone.is_mobile?
```

or:

```
BrazilianValidators::Phone.is_mobile?('11999999999')
```

Please note that will remove any non-digit from phone number and it will remove zeros if it starts the number.
