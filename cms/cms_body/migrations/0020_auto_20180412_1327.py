# Generated by Django 2.0.4 on 2018-04-12 13:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cms_body', '0019_auto_20180408_0827'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='author',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='documents', to='cms_body.Author', verbose_name='Autor'),
        ),
        migrations.AlterField(
            model_name='document',
            name='edition',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='documents', to='cms_body.Edition', verbose_name='Wydanie'),
        ),
        migrations.AlterField(
            model_name='document',
            name='guests',
            field=models.ManyToManyField(blank=True, related_name='documents', to='cms_body.Guest', verbose_name='Goście'),
        ),
        migrations.AlterField(
            model_name='edition',
            name='hosts',
            field=models.ManyToManyField(related_name='editions', to='cms_body.Host', verbose_name='Prowadzący'),
        ),
    ]