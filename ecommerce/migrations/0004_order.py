# Generated by Django 2.2.8 on 2021-02-23 11:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0003_auto_20210121_1640'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('order_id', models.AutoField(primary_key=True, serialize=False)),
                ('items_json', models.CharField(max_length=5000)),
                ('amount', models.IntegerField(default=0)),
                ('name', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=48)),
                ('address', models.TextField()),
                ('city', models.CharField(max_length=25)),
                ('state', models.CharField(max_length=25)),
                ('zip_code', models.IntegerField()),
                ('phone', models.CharField(max_length=11)),
                ('date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
