from django.shortcuts import render
from ecommerce.models import Top_product,Top_brand
# Create your views here.

def home(request):
	tp = Top_product.objects.all()
	tb = Top_brand.objects.all()
	return render(request, 'home.html',{'tp':tp,'tb':tb})