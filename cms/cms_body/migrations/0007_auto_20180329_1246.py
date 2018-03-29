# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-03-29 12:46
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('cms_body', '0006_document_topic'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='autor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='cms_body.Author', verbose_name='Autor'),
        ),
        migrations.AlterField(
            model_name='document',
            name='content',
            field=tinymce.models.HTMLField(verbose_name='Treść'),
        ),
    ]