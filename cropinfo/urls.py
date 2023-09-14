from django.urls import path
from .import views

urlpatterns=[
		path('crop_info_home',views.crop_info_home,name='crop_info_home'),
		path('sesame_view',views.sesame_view,name='sesame_view'),
		path('cumin_view',views.cumin_view,name='cumin_view'),
		path('millet_view',views.millet_view,name='millet_view'),
		path('wheat_view',views.wheat_view,name='wheat_view'),

			]