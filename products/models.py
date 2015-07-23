from django.db import models
from django.utils.text import slugify

from datetime import datetime

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
    slug = models.SlugField(unique=True, editable=False)
    # date_created = models.DateTimeField(default=datetime.now, editable=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Product, self).save(*args, **kwargs)

    def __str__(self):
        return self.name

    @models.permalink
    def get_absolute_url(self):
        return 'products:product', (self.slug,)
