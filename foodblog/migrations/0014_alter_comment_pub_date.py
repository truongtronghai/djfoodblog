# Generated by Django 3.2.9 on 2021-12-20 08:37

import datetime

from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):
    dependencies = [
        ("foodblog", "0013_comment_pub_date"),
    ]

    operations = [
        migrations.AlterField(
            model_name="comment",
            name="pub_date",
            field=models.DateTimeField(
                default=datetime.datetime(2021, 12, 20, 8, 37, 45, 171485, tzinfo=utc)
            ),
        ),
    ]
