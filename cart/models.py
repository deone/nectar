from django.db import models
from django.core.validators import RegexValidator

from products.models import Product

class Cart(models.Model):
    business_name = models.CharField(max_length=100)
    account_number = models.CharField(max_length=30)
    contact_name = models.CharField(max_length=50)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    contact_number = models.CharField(validators=[phone_regex], max_length=15) # validators should be a list
    contact_email = models.EmailField()
    delivery_method = models.CharField(max_length=20)

class LineItem(models.Model):
    cart = models.ForeignKey(Cart)
    product = models.ForeignKey(Product)
    quantity = models.SmallIntegerField()
