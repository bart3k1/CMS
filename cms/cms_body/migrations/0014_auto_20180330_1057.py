# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-03-30 10:57
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cms_body', '0013_auto_20180330_0936'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='document',
            options={'verbose_name': 'Dokument', 'verbose_name_plural': 'Dokumenty'},
        ),
    ]
