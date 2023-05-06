# Generated by Django 3.2.9 on 2021-11-29 09:34

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("foodblog", "0002_auto_20211129_1620"),
    ]

    operations = [
        migrations.CreateModel(
            name="Tags",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("tag", models.CharField(max_length=50)),
                ("count", models.IntegerField(default=0)),
            ],
        ),
        migrations.RenameModel(
            old_name="Post",
            new_name="Posts",
        ),
        migrations.RenameModel(
            old_name="TextBlock",
            new_name="TextBlocks",
        ),
    ]
