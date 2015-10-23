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
    slug = models.SlugField(unique=True, editable=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Brand, self).save(*args, **kwargs)

    def __str__(self):
        return self.name

    @models.permalink
    def get_absolute_url(self):
        return 'products:brand', (self.slug,)

class SubCategory(models.Model):
    name = models.CharField(max_length=100)
    category = models.ForeignKey(Category)
    slug = models.SlugField(unique=True, editable=False)

    class Meta:
        verbose_name_plural = "subcategories"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name + self.category.name)
        super(SubCategory, self).save(*args, **kwargs)

    def __str__(self):
        return '%s - %s' % (self.name, self.category.name)

    @models.permalink
    def get_absolute_url(self):
        return 'products:subcategory', (self.slug,)

class Product(models.Model):
    name = models.CharField(max_length=100)
    subcategory = models.ForeignKey(SubCategory)
    brand = models.ForeignKey(Brand)
    code = models.CharField(max_length=20, unique=True, null=True, blank=True)
    image = models.ImageField(upload_to="product_images")
    description = models.TextField()
    slug = models.SlugField(unique=True, editable=False)
    date_created = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        ordering = ('-date_created',)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name + '-' + self.code)
        super(Product, self).save(*args, **kwargs)

    def __str__(self):
        return self.name

    def to_dict(self):
        return {
            'product_pk': self.pk,
            'name': self.name,
            'code': self.code,
            'image': self.image.url
        }

    @models.permalink
    def get_absolute_url(self):
        return 'products:product', (self.slug,)
