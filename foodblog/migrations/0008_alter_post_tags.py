# Generated by Django 3.2.9 on 2021-12-03 10:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('foodblog', '0007_post_tags'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='tags',
            field=models.ManyToManyField(blank=True, null=True, to='foodblog.Tag'),
        ),
    ]
