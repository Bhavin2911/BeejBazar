from rest_framework import serializers
from .models import Cart,Product

# for serializers relation

# class CartSerializer(serializers.ModelSerializer):
# 	# proby = serializers.StringRelatedField(many=True,read_only=True)
# 	# song = serializers.HyperlinkedRelatedField(many=True,read_only=True,view_name='song-detail')
# 	class Meta:
# 		model = Cart
# 		fields = ['cart_id','quantity','product_id']


class ProductSerializer(serializers.ModelSerializer):
	class Meta:
		model = Product
		fields = ['product_id','product_name','Price','product_image']


# # for nested serializer

class CartSerializer(serializers.ModelSerializer):
	proby = ProductSerializer(read_only=True, source='product_id')
	# proby = serializers.PrimaryKeyRelatedField(read_only=True)
	class Meta:
		model = Cart
		fields = ["cart_id","quantity","proby"]
