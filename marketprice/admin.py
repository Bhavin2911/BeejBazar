from django.contrib import admin
from marketprice.models import Mp_zone,Mp_city,Mp_product
# Register your models here.

class AdminPro(admin.ModelAdmin):
	list_display = ['item','city_id']
	search_fields = ['item']
	list_filter = ['city_id']

class AdminCity(admin.ModelAdmin):
	list_display = ['city_name','zone_id']
	search_fields = ['city_name']
	list_filter = ['zone_id']

admin.site.register(Mp_zone)
admin.site.register(Mp_city,AdminCity)
admin.site.register(Mp_product,AdminPro)