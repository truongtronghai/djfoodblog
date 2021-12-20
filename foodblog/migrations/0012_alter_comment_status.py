# Generated by Django 3.2.9 on 2021-12-20 04:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('foodblog', '0011_comment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='status',
            field=models.CharField(choices=[('a', 'approved'), ('u', 'unapproved'), ('s', 'spam'), ('t', 'trash')], default='u', max_length=1),
        ),
    ]