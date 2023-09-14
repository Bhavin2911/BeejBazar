from django.urls import path
from .import views

urlpatterns = [
	path('marketprice_zone',views.marketprice_zone,name='marketprice_zone'),
	path('marketprice_city/<int:zone_id>',views.marketprice_city,name='marketprice_city'),
	path('marketprice_product/<int:city_id>',views.marketprice_product,name='marketprice_product')
]