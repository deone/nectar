# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(unique=True, max_length=100)),
                ('image', models.ImageField(upload_to='brand_images')),
                ('slug', models.SlugField(unique=True, editable=False)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(unique=True, max_length=100)),
            ],
            options={
                'verbose_name_plural': 'categories',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(unique=True, max_length=100)),
                ('code', models.CharField(unique=True, max_length=20)),
                ('image', models.ImageField(upload_to='product_images')),
                ('description', models.TextField()),
                ('slug', models.SlugField(unique=True, editable=False)),
                ('date_created', models.DateTimeField(auto_now=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='SubCategory',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(unique=True, max_length=100)),
                ('slug', models.SlugField(unique=True, editable=False)),
                ('brand', models.ForeignKey(to='products.Brand')),
                ('category', models.ForeignKey(to='products.Category')),
            ],
            options={
                'verbose_name_plural': 'subcategories',
            },
        ),
        migrations.AddField(
            model_name='product',
            name='subcategory',
            field=models.ForeignKey(to='products.SubCategory'),
        ),
    ]
