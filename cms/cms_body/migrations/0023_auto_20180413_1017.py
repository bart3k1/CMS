# Generated by Django 2.0.4 on 2018-04-13 10:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms_body', '0022_auto_20180413_1016'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='lead',
            field=models.TextField(max_length=400, null=True, verbose_name='Lead'),
        ),
        migrations.AlterField(
            model_name='guest',
            name='notes',
            field=models.TextField(blank=True, max_length=400, null=True, verbose_name='Notatki'),
        ),
    ]
