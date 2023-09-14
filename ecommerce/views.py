from django.shortcuts import render,redirect,HttpResponseRedirect,HttpResponse
from django.contrib import messages
from .models import Cart,Category,Product,Brand,Order,Wishlist,Order_tracker,Order_item,Contact_us,Product_review
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
# from django.core import serializers
# from .Payment_Gateway import Checksum
from django.conf import settings
from middlewares.auth import auth_middleware
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
from django.db.models import Avg 
from .serializers import CartSerializer
from rest_framework.renderers import JSONRenderer

def cart_show(request):
	cprod =Cart.objects.filter(User=request.user)
	serializer = CartSerializer(cprod,many=True)
	jsondata = JSONRenderer().render(serializer.data)
	return HttpResponse(jsondata, content_type="application/json")

def add_cart(request):
	cid = request.GET.get('add_cart_id')
	prod = Product.objects.get(product_id=cid)
	# print(cid)
	cpro = Cart.objects.filter(User=request.user,product_id=cid)
	if cpro:
		return JsonResponse({'status':0})
	else:	
		c = Cart(User=request.user,product_id=prod,quantity=1).save()

		cprod =Cart.objects.filter(User=request.user)
		serializer = CartSerializer(cprod,many=True)
		jsondata = JSONRenderer().render(serializer.data)
		return HttpResponse(jsondata,content_type="application/json")
	# return HttpResponse(content_type="application/json")


def del_cart(request):
	did = request.GET.get('del_cart_id')
	dcart = Cart.objects.get(product_id=did,User=request.user)
	dcart.delete()

	cprod =Cart.objects.filter(User=request.user)
	serializer = CartSerializer(cprod,many=True)
	jsondata = JSONRenderer().render(serializer.data)
	return HttpResponse(jsondata,content_type="application/json")

def plus_cart(request):
	pid = request.GET.get('plus_cart_id')
	cpro = Cart.objects.get(User=request.user,product_id=pid)
	if cpro:
		cpro.quantity +=1
		cpro.save()
		cprod = Cart.objects.filter(User=request.user)
		serializer = CartSerializer(cprod,many=True)
		jsondata = JSONRenderer().render(serializer.data)
		return HttpResponse(jsondata,content_type="application/json")

def minus_cart(request):
	mid = request.GET.get('minus_cart_id')
	cpro = Cart.objects.get(User=request.user,product_id=mid)
	if cpro:
		cpro.quantity -=1
		if cpro.quantity <= 0:
			cpro.delete()
		else:	
			cpro.save()
		cprod = Cart.objects.filter(User=request.user)
		serializer = CartSerializer(cprod,many=True)
		jsondata = JSONRenderer().render(serializer.data)
		return HttpResponse(jsondata,content_type="application/json")


def catepro(request,category_id):
	prods = Product.objects.filter(category_id=category_id)
	catN = prods[0].category_id
	return render(request, 'Ecommerce/catepro.html',{'prods':prods,'catN':catN})

def brands(request):
	allbrands = Brand.objects.all()
	return render(request, 'Ecommerce/brands.html',{'allbrands':allbrands})

def brandpro(request,brand_id):
	bprods =Product.objects.filter(brand_id=brand_id)
	brN = bprods[0].brand_id
	return render(request, 'Ecommerce/brandpro.html',{'bprods':bprods,'brN':brN})	

def products(request):
	allprods = Product.objects.all()
	return render(request, 'Ecommerce/products.html',{'allprods':allprods})	

def prodview(request,proid):
	# print(type(proid))
	prod =Product.objects.get(product_id=proid)
	all_rev = Paginator(Product_review.objects.filter(product_id=proid).order_by('-product_review_id'), 3)
	page= request.GET.get('page')
	try:
		rprod = all_rev.page(page)
	except PageNotAnInteger:
		rprod = all_rev.page(1)
	except EmptyPage:	
		rprod = all_rev.page(all_rev.num_pages)		

	avgrate = avarage_rate(proid)	
	return render(request, 'Ecommerce/product-view.html',{'prod':prod,'rprod':rprod,'all_rev':all_rev,'avgrate':avgrate})	

def avarage_rate(proid):
	reviews = Product_review.objects.filter(product_id=proid).aggregate(avarage=Avg('rating'))
	avg = 0
	if reviews['avarage'] is not None:
		avg = float(reviews['avarage'])
	return avg


@auth_middleware 
def checkOut(request):

	if request.method=="POST":
		# items_json=request.POST.get('itemsjson', '')
		amount=request.POST.get('amount','')
		name = request.POST.get('name', '')
		email = request.POST.get('email', '')
		address = request.POST.get('address1', '')
		city = request.POST.get('city', '')
		state = request.POST.get('state', '')
		zip_code = request.POST.get('zip_code', '')
		phone = request.POST.get('phone', '')
		payment_type = request.POST['payment_type']

		# print(amount)
		if payment_type == '1':


			order_Tracker = Order_tracker.objects.get(order_tracker_id=1)
			order = Order(User=request.user,name=name, email=email,address=address,city=city,state=state,zip_code=zip_code, phone=phone,amount=amount,order_tracker_id=order_Tracker)
			order.save()

			latest_ordered = Order.objects.last()
			# update=orderUpdate(order_id=order.order_id,update_desc="The order has been placed")
			# update.save()
			# cart_products = json.loads(items_json)
			cart_products = Cart.objects.filter(User=request.user)

			for c_product in cart_products:
				c_product_id = c_product.product_id.product_id		
				print(c_product_id)
				pro = Product.objects.get(product_id=c_product_id)
				print(pro)
				c_product_qty = c_product.quantity		

				print(c_product_qty)
				order_item = Order_item(product_id=pro,order_id= latest_ordered,quantity=c_product_qty)
				# print("6.7")
				order_item.save()
			# thank=True
			print("7")

			id=order.order_id
			return redirect('/ecommerce/ConfirmOrder/' + str(order.order_id))

		else:

			order_Tracker = Order_tracker.objects.get(order_tracker_id=1)
			order = Order(User=request.user,name=name, email=email,address=address,city=city,state=state,zip_code=zip_code, phone=phone,amount=amount,order_tracker_id=order_Tracker,payment_type="Online Payment")
			order.save()

			return 1


			# param_dict = {


			# 	'MID': settings.PAYTM_MERCHANT_ID,
			# 	'ORDER_ID': str(order.order_id),
			# 	'TXN_AMOUNT': str(order.amount),
			# 	'CUST_ID': 'cus'+str(order.phone),
			# 	'INDUSTRY_TYPE_ID': 'Retail',
			# 	'WEBSITE': 'WEBSTAGING',
			# 	'CHANNEL_ID': 'WEB',
			# 	'PAYMENT_MODE_ONLY':'YES',
			# 	'PAYMENT_TYPE_ID':'DC',
			# 	'CALLBACK_URL':'http://127.0.0.1:8000/ecommerce/handlerequest/'+ str(order.order_id),
			# }

			# param_dict['CHECKSUMHASH'] = Checksum.generate_checksum(param_dict, settings.PAYTM_API_KEY)

			# return render(request,'/Ecommerce/paytm.html',{'param_dict': param_dict})
	

	return render(request, 'Ecommerce/checkout.html')    




# @csrf_exempt
# def handlerequest(request):
# 	# paytm will send you post request here
# 	form = request.POST
# 	response_dict = {}
# 	for i in form.keys():
# 		response_dict[i] = form[i]
# 		if i == 'CHECKSUMHASH':
# 			checksum = form[i]

# 	verify = Checksum.verify_checksum(response_dict, settings.PAYTM_MERCHANT_ID, checksum)
# 	if verify:
# 		if response_dict['RESPCODE'] == '01':
# 			print('order successful')
# 			order_data = Order.objects.last()
# 			order_data.payment_transaction_id = response_dict['TXNID']
# 			order_data.save()
# 		else:
# 			print('order was not successful because' + response_dict['RESPMSG'])

# 	return redirect('/ecommerce/ConfirmOrder' + str(order_data.order_id))



def about(request):
	return render(request, 'Ecommerce/about.html')

def gopniya(request):
	return render(request, 'Ecommerce/gopniya.html')

def terms(request):
	return render(request, 'Ecommerce/terms.html')	

@auth_middleware 
def contact(request):
	if request.method == 'POST':
		cname= request.POST['name']
		cphone = request.POST['phone']
		cemail = request.POST['email']
		cdesc = request.POST['desc']

		mycontact = Contact_us(name=cname,email=cemail,contact_no=cphone,desc=cdesc)
		mycontact.save()
		messages.success(request,"Your message has been successfully submited")
		return redirect('/')	

	return render(request,'Ecommerce/contactus.html')	


# start wishlist functions 

def add_wishlist(request):
	wid = request.GET.get('add_wishlist_id')
	# print(wid)
	wprod =Product.objects.get(product_id=wid)
	wishl =Wishlist.objects.filter(product_id=wprod,User=request.user)

	if wishl:
		return JsonResponse({'status':0})
		# messages.success(request,"This Product is already in your wishlist")
	else:	
		wlist = Wishlist(product_id=wprod,User=request.user)
		wlist.save()
		# messages.success(request,"Product successfully add to your wishlist")
		return JsonResponse({'status':'Save'})

def del_wishlist(request):
	dwid = request.GET.get('del_wishlist_id')
	# print(dwid)
	dWlist = Wishlist.objects.get(product_id=dwid,User=request.user)
	dWlist.delete()
	# allWlist = Wishlist.objects.filter(User=request.user)
	return JsonResponse({'status':'delete',})
	# messages.error(request,"Product successfully delete from your wishlist")
	# return redirect('/ecommerce/show_wishlist')


@auth_middleware
def show_wishlist(request):
	allWlist = Wishlist.objects.filter(User=request.user)
	return render(request, 'Ecommerce/wishlist.html',{'allWlist':allWlist})	


# def add_wishlist(request,wid):
# 	url = request.META.get('HTTP_REFERER')

# 	wprod =Product.objects.get(product_id=wid)
# 	wishl =Wishlist.objects.filter(product_id=wprod)

# 	if wishl:
# 		messages.success(request,"This Product is already in your wishlist")
# 	else:	
# 		wlist = Wishlist(product_id=wprod,User=request.user)
# 		wlist.save()
# 		messages.success(request,"Product successfully add to your wishlist")
# 	return HttpResponseRedirect(url)
		
# @auth_middleware 
# def show_wishlist(request):
# 	allWlist = Wishlist.objects.filter(User=request.user)
# 	return render(request, 'Ecommerce/wishlist.html',{'allWlist':allWlist})	



def addCart_delwishlist(request,adwid):
	dWlist = Wishlist.objects.get(product_id=adwid,User=request.user)
	dWlist.delete()
	messages.success(request,"Product successfully add to your cart")
	return redirect('/ecommerce/show_wishlist')	

 # end wishlist functions


def ConfirmOrder(request,oid):
	cart_products = Cart.objects.filter(User=request.user).delete()
	order_data = Order.objects.get(order_id=oid)
	order_item_data = Order_item.objects.filter(order_id=oid)
	return render(request,'Ecommerce/ConfirmOrder.html',{'order_data':order_data,'order_item_data' : order_item_data })	

def viewOrder(request,oid):
	order_data = Order.objects.get(order_id=oid)
	order_item_data = Order_item.objects.filter(order_id=oid)
	return render(request,'Ecommerce/viewOrder.html',{'order_data':order_data,'order_item_data' : order_item_data })	

def orderHistory(request):
	o_data_all = Order.objects.filter(User=request.user).order_by('-order_id')
	return render(request, 'Ecommerce/orderhistory.html',{'o_data_all':o_data_all})

def orderTracker(request,oid):
	order_data = Order.objects.get(order_id=oid)
	# o_tracker = Order_tracker.objects.get(order_tracker_id=tid)
	return render(request, 'Ecommerce/ordertracker.html',{'order_data':order_data})

def search_pro(request):
	query = request.GET['q_pro']

	if len(query)>50 or len(query)==0:
		allpro=Product.objects.none()
	else:	
		allpro = Product.objects.filter(product_name__icontains=query)

	if allpro.count() == 0:
		messages.warning(request,'No search result found. please refine your query.')	
	
	param={'allpro':allpro,'query':query}
	return render(request, 'Ecommerce/search_pro.html',param)


def product_reviews(request):
	url = request.META.get('HTTP_REFERER')
	if request.method == 'POST':
		rate = request.POST.get('rate','0')
		pid = request.POST['pid']
		desc = request.POST['desc']

		prid = Product.objects.get(product_id=pid)
		myreview = Product_review(User=request.user,product_id=prid,review_desc=desc,rating=rate)
		myreview.save()
		messages.success(request,"Your review has been successfully submited")
		return HttpResponseRedirect(url)
	else:
		messages.success(request,"Something went wrong !")
		return HttpResponseRedirect(url)
	return HttpResponseRedirect(url)
