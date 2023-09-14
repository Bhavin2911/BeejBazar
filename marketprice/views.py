from django.shortcuts import render
from marketprice.models import Mp_zone,Mp_city,Mp_product
from middlewares.auth import auth_middleware

@auth_middleware 
def marketprice_zone(request):
	get_data=Mp_zone.objects.all().order_by('-pk')
	get_products = Mp_product.objects.all()
	return render(request,'MarketPrice/marketprice_zone.html',{'get_data':get_data,'get_products':get_products})


def marketprice_city(request,zone_id):
	check_data=Mp_city.objects.filter(zone_id=zone_id)
	check_zone = check_data[0].zone_id
	# print(check_zone)
	return render(request,'MarketPrice/marketprice_city.html',{'valid_data':check_data,'check_zone':check_zone})

def marketprice_product(request,city_id):
	check_data=Mp_product.objects.filter(city_id=city_id)
	obtain_city=Mp_city.objects.get(city_id=city_id)
	return render(request,'MarketPrice/marketprice_product.html',{'valid_data':check_data,'city':obtain_city})

	