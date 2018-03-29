# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-03-29 10:23
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cms_body', '0002_remove_author_phone2'),
    ]

    operations = [
        migrations.AlterField(
            model_name='author',
            name='name',
            field=models.CharField(max_length=40, verbose_name='Imię'),
        ),
        migrations.AlterField(
            model_name='author',
            name='phone',
            field=models.CharField(max_length=15, verbose_name='Telefon'),
        ),
        migrations.AlterField(
            model_name='author',
            name='surname',
            field=models.CharField(max_length=40, verbose_name='Nazwisko'),
        ),
        migrations.AlterField(
            model_name='edition',
            name='date',
            field=models.DateField(verbose_name='Data'),
        ),
        migrations.AlterField(
            model_name='edition',
            name='editor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cms_body.Author', verbose_name='Wydawca'),
        ),
        migrations.AlterField(
            model_name='edition',
            name='hosts',
            field=models.ManyToManyField(related_name='programs_hosts', to='cms_body.Host', verbose_name='Prowadzący'),
        ),
        migrations.AlterField(
            model_name='guest',
            name='alt_phone',
            field=models.CharField(max_length=128, verbose_name='Telefon/Menadżer'),
        ),
        migrations.AlterField(
            model_name='guest',
            name='name',
            field=models.CharField(max_length=40, verbose_name='Imię'),
        ),
        migrations.AlterField(
            model_name='guest',
            name='notes',
            field=models.CharField(max_length=200, null=True, verbose_name='Notatki'),
        ),
        migrations.AlterField(
            model_name='guest',
            name='phone',
            field=models.CharField(max_length=15, verbose_name='Telefon'),
        ),
        migrations.AlterField(
            model_name='guest',
            name='surname',
            field=models.CharField(max_length=40, verbose_name='Nazwisko'),
        ),
        migrations.AlterField(
            model_name='host',
            name='name',
            field=models.CharField(max_length=40, verbose_name='Imię'),
        ),
        migrations.AlterField(
            model_name='host',
            name='phone',
            field=models.CharField(max_length=15, verbose_name='Telefon'),
        ),
        migrations.AlterField(
            model_name='host',
            name='surname',
            field=models.CharField(max_length=40, verbose_name='Nazwisko'),
        ),
    ]