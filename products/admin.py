from django.contrib import admin

from .models import *

product_models = [Category, SubCategory, Brand, Product]
admin.site.register(product_models)
