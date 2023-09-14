from channels.generic.websocket import WebsocketConsumer
import json
from .models import *
from asgiref.sync import async_to_sync

class OrderTrackerProgress(WebsocketConsumer):
	def connect(self):
		self.room_name = self.scope['url_route']['kwargs']['oid']
		self.room_group_name = 'order-%s' % self.room_name
		# print(self.room_group_name)

		print('connect')
		async_to_sync(self.channel_layer.group_add)(self.room_group_name,self.channel_name)
		self.accept()
		# print(self.room_name)
		Otracker = Order.give_order_details(self.room_name)

		self.send(text_data = json.dumps({'payload':Otracker}))

	def disconnect(self,*args,**kwargs):
		print("disconnectd")
		async_to_sync(self.channel_layer.group_discard)(self.room_group_name,self.channel_name)
			
	def receive(self,text_data):
		# self.send(text_data = json.dumps({'payload':" I AM BHAVIN..."}))
		# print(text_data)

		async_to_sync(self.channel_layer.group_send)(self.room_group_name,{
			'type':'order_status',
			'payload':text_data
			})

				
	def order_status(self,event):
		Otracker = json.loads(event['value'])		
		self.send(text_data = json.dumps({'payload':Otracker}))




