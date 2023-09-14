# Generated by Django 3.2.5 on 2021-08-04 11:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0016_cart'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='quantity',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='category',
            name='category_image',
            field=models.ImageField(default=0, upload_to='ecommerce/category'),
            preserve_default=False,
        ),
    ]
