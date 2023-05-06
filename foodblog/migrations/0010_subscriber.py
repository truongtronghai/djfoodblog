# Generated by Django 3.2.9 on 2021-12-06 08:17

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("foodblog", "0009_alter_post_tags"),
    ]

    operations = [
        migrations.CreateModel(
            name="Subscriber",
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
                ("sub_email", models.EmailField(max_length=254)),
            ],
        ),
    ]
