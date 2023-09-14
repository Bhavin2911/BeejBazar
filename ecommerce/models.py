from django.db import models
from account.models import User
from django.db.models.signals import post_save
from channels.layers import get_channel_layer
from django.dispatch import receiver
from asgiref.sync import async_to_sync
import json

# Create your models here.
class Category(models.Model):
	category_id = models.AutoField(primary_key=True)
	category_name = models.CharField(max_length=15)
	category_image = models.ImageField(upload_to='ecommerce/category')

	def __str__(self):
		return self.category_name


class Brand(models.Model):
	brand_id = models.AutoField(primary_key=True)
	category_id = models.ForeignKey('Category',on_delete=models.SET_NULL,null=True)
	brand_name = models.CharField(max_length=15)
	brand_image = models.ImageField(upload_to='ecommerce/brands')

	def __str__(self):
		return self.brand_name 


class Product(models.Model):
	product_id = models.AutoField(primary_key=True)
	category_id = models.ForeignKey('Category',on_delete=models.SET_NULL,null=True)
	brand_id = models.ForeignKey('Brand',on_delete=models.SET_NULL,null=True)
	product_name = models.CharField(max_length=30)
	Price = models.IntegerField()
	desc = models.TextField()
	product_image = models.ImageField(upload_to='ecommerce/product')

	def __str__(self):
		return self.product_name + " " + " / " + " " + self.category_id.category_name + " " + " / " + " " + self.brand_id.brand_name



class Top_product(models.Model):
	topproduct_id = models.AutoField(primary_key=True)
	product_id =  models.ForeignKey(Product,on_delete=models.CASCADE)

	def __str__(self):
		return self.product_id.product_name


class Top_brand(models.Model):
	topbrand_id = models.AutoField(primary_key=True)
	brand_id =  models.ForeignKey(Brand,on_delete=models.CASCADE)

	def __str__(self):
		return self.brand_id.brand_name
	
class Cart(models.Model):
	cart_id = models.AutoField(primary_key=True)
	User = models.ForeignKey(User, on_delete=models.CASCADE)
	product_id =  models.ForeignKey(Product,on_delete=models.CASCADE,related_name='proby')
	quantity = models.IntegerField()

class Order_tracker(models.Model):
	order_tracker_id = models.AutoField(primary_key=True)
	status = models.CharField(max_length=30)

	def __str__(self):
		return str(self.status)

	# @staticmethod
	# def give_order_details(order_tracker_id):
	# 	instance = Order_tracker.objects.filter(order_tracker_id=order_tracker_id).first()
	# 	data = {}
	# 	data['order_tracker_id'] = instance.order_tracker_id
	# 	data['status'] = instance.status
		
	# 	progress_per = 0
	# 	if instance.status == 'Order confirmed':
	# 		progress_per = 25
	# 	elif instance.status == 'Shipped':
	# 		progress_per = 50
	# 	elif instance.status == 'Cancelled':
	# 		progress_per = 0
	# 	elif instance.status == 'Out for delivery':
	# 		progress_per = 75
	# 	elif instance.status == 'Deliverd':
	# 		progress_per = 100		

	# 	data['progress'] = progress_per

	# 	return data	


class Order(models.Model):
	order_id = models.AutoField(primary_key=True)
	order_tracker_id = models.ForeignKey(Order_tracker, on_delete=models.CASCADE)
	User = models.ForeignKey(User, on_delete=models.CASCADE)
	amount = models.IntegerField(default=0)
	name = models.CharField(max_length=100)
	email = models.CharField(max_length=48)
	address = models.TextField()
	city = models.CharField(max_length=25)
	state = models.CharField(max_length=25)
	zip_code = models.IntegerField()
	phone = models.BigIntegerField()		
	date = models.DateTimeField(auto_now_add=True)
	payment_transaction_id = models.CharField(max_length=100,blank=True)
	payment_type = models.CharField(max_length=50,default="Cash on delivery")


	def __str__(self):
		return str(self.order_id)

	@staticmethod
	def give_order_details(oid):
		# print(oid)
		# print("hello")
		instance = Order.objects.filter(order_id=oid).first()
		# print(instance)
		data = {}
		data['order_tracker_id'] = instance.order_id
		data['status'] = instance.order_tracker_id.status
		# print(data['status'])
		# print(data['order_tracker_id'])
		
		progress_per = 0
		if instance.order_tracker_id.status == 'Order confirmed':
			progress_per = 25
		elif instance.order_tracker_id.status == 'Shipped':
			progress_per = 50
		elif instance.order_tracker_id.status == 'Cancelled':
			progress_per = 0
		elif instance.order_tracker_id.status == 'Out for delivery':
			progress_per = 75
		elif instance.order_tracker_id.status == 'Deliverd':
			progress_per = 100		

		data['progress'] = progress_per
		return data		

@receiver(post_save,sender = Order)
def order_status_handler(sender,instance,created,**kwargs):
	if not created:
		channel_layer = get_channel_layer()
		data = {}
		data['order_id'] = instance.order_id
		data['status'] = instance.order_tracker_id.status
		
		progress_per = 0
		if instance.order_tracker_id.status == 'Order confirmed':
			progress_per = 25
		elif instance.order_tracker_id.status == 'Shipped':
			progress_per = 50
		elif instance.order_tracker_id.status == 'Cancelled':
			progress_per = 0
		elif instance.order_tracker_id.status == 'Out for delivery':
			progress_per = 75
		elif instance.order_tracker_id.status == 'Deliverd':
			progress_per = 100		

		data['progress'] = progress_per
		async_to_sync(channel_layer.group_send)(
			'order-%s' % instance.order_id,{
			'type':'order_status',
			'value':json.dumps(data)
			}
			)

class Order_item(models.Model):
	order_item_id =  models.AutoField(primary_key=True)
	order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
	product_id = models.ForeignKey(Product,on_delete=models.CASCADE)
	quantity = models.IntegerField()

	def __str__(self):
		return str(self.order_id.name) + '  ' + str(self.product_id.product_name)+ '  ' + str(self.quantity)  

class Wishlist(models.Model):
	wishlist_id = models.AutoField(primary_key=True)
	User = models.ForeignKey(User, on_delete=models.CASCADE)
	product_id =  models.ForeignKey(Product,on_delete=models.CASCADE)		

	def __str__(self):
		return str(self.User) + ' ' + self.product_id.product_name


class Contact_us(models.Model):
	contact_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=50)
	email = models.CharField(max_length=48)
	contact_no = models.BigIntegerField()		
	desc = models.TextField()

	def __str__(self):
		return str(self.name)

class Product_review(models.Model):
	product_review_id = models.AutoField(primary_key=True)
	product_id =  models.ForeignKey(Product,on_delete=models.CASCADE)		
	User = models.ForeignKey(User, on_delete=models.CASCADE)
	rating = models.IntegerField(default=1)
	review_desc = models.TextField()
	date = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return str(self.User)


		