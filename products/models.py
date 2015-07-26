from django.db import models
from django.utils.text import slugify

from datetime import datetime

class Common(models.Model):
    name = models.CharField(max_length=100, unique=True)

    class Meta:
        abstract = True

class Category(Common):
    image = models.ImageField(upload_to="category_images")

    class Meta:
        verbose_name_plural = "categories"

    def __str__(self):
        return self.name

class Brand(Common):
    image = models.ImageField(upload_to="brand_images")
    slug = models.SlugField(unique=True, editable=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Brand, self).save(*args, **kwargs)

    def __str__(self):
        return self.name

    @models.permalink
    def get_absolute_url(self):
        return 'products:brand', (self.slug,)

class SubCategory(Common):
    brand = models.ForeignKey(Brand)
    category = models.ForeignKey(Category)
    slug = models.SlugField(unique=True, editable=False)

    class Meta:
        verbose_name_plural = "sub-categories"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(SubCategory, self).save(*args, **kwargs)

    def __str__(self):
        return self.name

    @models.permalink
    def get_absolute_url(self):
        return 'products:subcategory', (self.slug,)

class Product(Common):
    subcategory = models.ForeignKey(SubCategory)
    code = models.IntegerField(unique=True)
    image = models.ImageField(upload_to="product_images")
    description = models.TextField()
    slug = models.SlugField(unique=True, editable=False)
    date_created = models.DateTimeField(auto_now=True, editable=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Product, self).save(*args, **kwargs)

    def __str__(self):
        return self.name

    @models.permalink
    def get_absolute_url(self):
        return 'products:product', (self.slug,)
