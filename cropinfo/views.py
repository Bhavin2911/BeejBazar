from django.shortcuts import render
from middlewares.auth import auth_middleware

@auth_middleware 
def crop_info_home(request):
	return render(request,'Crop_info/crop_information.html')

def sesame_view(request):
	return render(request,'Crop_info/sesame.html')

def cumin_view(request):
	return render(request, 'Crop_info/cumin.html')

def millet_view(request):
	return render(request,'Crop_info/millet_view.html')

def wheat_view(request):
	return render(request,'Crop_info/wheat_view.html')

