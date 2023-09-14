from django.contrib import admin
from .models import Cart,Category,Product,Brand,Top_product,Top_brand,Order,Wishlist,Order_tracker,Order_item,Contact_us,Product_review
from import_export.admin import ImportExportModelAdmin
# Register your models here.

class AdminProduct(admin.ModelAdmin):
	search_fields = ['product_name']
	list_display = ['product_name','category_id','brand_id']
	list_filter = ['category_id','brand_id']

class AdminCategory(admin.ModelAdmin):
	list_display = ['category_name']

class AdminBrand(admin.ModelAdmin):
	list_display = ['brand_name','category_id']
	search_fields = ['brand_name']
	list_filter = ['category_id']


class AdminOrder(admin.ModelAdmin):
	list_display = ['order_id','User','date','payment_type','order_tracker_id']
	list_editable = ['order_tracker_id']
	list_filter = ['date','payment_type']

@admin.register(Order)
class order_data(ImportExportModelAdmin,AdminOrder):
	pass

@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
	list_display = ['cart_id','User','product_id','quantity']
	

class AdminOrderitem(admin.ModelAdmin):
	list_display = ['order_item_id','order_id','product_id','quantity']
	list_filter = ['order_id']


class AdminContact(admin.ModelAdmin):
	list_display = ['name','contact_no','email']
	# search_fields = ['order_tracker_id']
	list_filter = ['name']


class AdminProduct_reviews(admin.ModelAdmin):
	list_display = ['User','product_id','rating','review_desc']
	# search_fields = ['order_tracker_id']
	list_filter = ['rating']


admin.site.register(Category,AdminCategory)
admin.site.register(Product,AdminProduct)
admin.site.register(Brand,AdminBrand)
admin.site.register(Top_product)
admin.site.register(Top_brand)
# admin.site.register(Order,order)
admin.site.register(Order_tracker)
admin.site.register(Order_item,AdminOrderitem)
admin.site.register(Wishlist)
admin.site.register(Contact_us,AdminContact)
admin.site.register(Product_review,AdminProduct_reviews)



