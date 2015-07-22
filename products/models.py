from django.db import models

class Common(models.Model):
    name = models.CharField(max_length=100, unique=True)

    class Meta:
        abstract = True

class Category(Common):
    pass

    class Meta:
        verbose_name_plural = "categories"

    def __str__(self):
        return self.name

class Brand(Common):
    image = models.ImageField(upload_to="brand_images")

    def __str__(self):
        return self.name

class SubCategory(Common):
    brand = models.ForeignKey(Brand)
    category = models.ForeignKey(Category)

    class Meta:
        verbose_name_plural = "sub-categories"

    def __str__(self):
        return self.name

class Product(Common):
    subcategory = models.ForeignKey(SubCategory)
    code = models.CharField(max_length=50, unique=True)
    image = models.ImageField(upload_to="product_images")
    description = models.TextField()

    def __str__(self):
        return self.name
