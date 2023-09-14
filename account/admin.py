from django.contrib import admin
from .models import User
# Register your models here.

class UserAdmin(admin.ModelAdmin):
	search_fields = ['username']
	list_display = ['username','email','User_mo']

admin.site.register(User,UserAdmin)
