# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-03-29 12:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms_body', '0005_document'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='topic',
            field=models.CharField(default='TYTUL', max_length=40, verbose_name='Tytuł'),
            preserve_default=False,
        ),
    ]