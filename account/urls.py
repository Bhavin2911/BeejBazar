from django.urls import path
from . import views

urlpatterns = [
	path('',views.registration,name='registration'),
	path('log',views.log,name='log'),
	path('handleregi', views.handleregi, name='handleregi'),
	path('handlelog', views.handlelog, name='handlelog'),
	path('lgout', views.handlelgout, name='handlelgout'),
    path('password_reset', views.password_reset_request, name="password_reset"),
]
