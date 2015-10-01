# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0003_auto_20150927_2225'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subcategory',
            name='brand',
        ),
        migrations.AddField(
            model_name='product',
            name='brand',
            field=models.ForeignKey(default=9, to='products.Brand'),
            preserve_default=False,
        ),
    ]
