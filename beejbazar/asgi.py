import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter,URLRouter
from channels.auth import AuthMiddlewareStack
from django.urls import path
from ecommerce.consumers import OrderTrackerProgress
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'beejbazar.settings')

ws_patterns = [
	path('ws/ecommerce/orderTracker/<int:oid>',OrderTrackerProgress.as_asgi())
]

application = ProtocolTypeRouter({
	'http':get_asgi_application(),
	'websocket':AuthMiddlewareStack(
		URLRouter(
			ws_patterns
			)
		)

	})
