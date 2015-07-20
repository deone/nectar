from django.db import models

# Create your models here.

# product lines = categories
# brands
# products

class Common(models.Model):
    name = models.CharField(max_length=100, unique=True)

    class Meta:
        abstract = True

class Category(Common):
    pass

class SubCategory(Common):
    category = models.ForeignKey(Category)

class Brand(Common):
    category = models.ForeignKey(Category)
    image = models.ImageField(upload_to="brand_images")

class Product(Common):
    category = models.ForeignKey(Category)
    brand = models.ForeignKey(Brand)
    code = models.CharField(max_length=50, unique=True)
    image = models.ImageField(upload_to="product_images")
    description = models.TextField()

    def __str__(self):
        return self.name
