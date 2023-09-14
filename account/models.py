from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.

class User(AbstractUser):
	User_mo = models.BigIntegerField()
	State = models.CharField(max_length=20,blank=False)
	District = models.CharField(max_length=20,blank=False)
	City = models.CharField(max_length=20,blank=False)

