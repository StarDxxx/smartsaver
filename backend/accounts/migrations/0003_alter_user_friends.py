# Generated by Django 4.0.4 on 2022-05-20 06:33

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_user_is_active_user_is_admin'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='friends',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
    ]
