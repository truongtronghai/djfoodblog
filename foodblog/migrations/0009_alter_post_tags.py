# Generated by Django 3.2.9 on 2021-12-03 23:40

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("foodblog", "0008_alter_post_tags"),
    ]

    operations = [
        migrations.AlterField(
            model_name="post",
            name="tags",
            field=models.ManyToManyField(blank=True, to="foodblog.Tag"),
        ),
    ]
