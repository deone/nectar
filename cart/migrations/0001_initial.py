# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('products', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('business_name', models.CharField(max_length=100)),
                ('account_number', models.CharField(max_length=30)),
                ('contact_name', models.CharField(max_length=50)),
                ('contact_number', models.CharField(validators=[django.core.validators.RegexValidator(message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.", regex='^\\+?1?\\d{9,15}$')], max_length=15)),
                ('contact_email', models.EmailField(max_length=254)),
                ('delivery_method', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='LineItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('quantity', models.SmallIntegerField()),
                ('cart', models.ForeignKey(to='cart.Cart')),
                ('product', models.ForeignKey(to='products.Product')),
            ],
        ),
    ]
