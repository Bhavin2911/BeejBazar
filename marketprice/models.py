from django.db import models
from django.utils.timezone import now
# Create your models here.
class Mp_zone(models.Model):
	zone_id=models.AutoField(primary_key=True)
	zone_name=models.CharField(max_length=30)

	def __str__(self):
		return self.zone_name

class Mp_city(models.Model):
	city_id=models.AutoField(primary_key=True)
	zone_id=models.ForeignKey(Mp_zone,on_delete=models.CASCADE)
	city_name=models.CharField(max_length=30)
	date_time=models.DateTimeField(default=now)

	def __str__(self):
		return self.city_name

class Mp_product(models.Model):
	mpproduct_id=models.AutoField(primary_key=True)
	city_id=models.ForeignKey(Mp_city,on_delete=models.CASCADE)
	item=models.CharField(max_length=50)
	lower_price=models.FloatField()
	upper_price=models.FloatField()

	def __str__(self):
		return self.item


