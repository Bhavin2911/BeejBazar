from django.db import models
from account.models import User
from django.utils.timezone import now
# Create your models here.
class Post(models.Model):
	post_id=models.AutoField(primary_key=True)
	user=models.ForeignKey(User,on_delete=models.CASCADE)
	caption=models.TextField()
	image=models.ImageField(upload_to="socialmedia",default="project_images/logo-header.png")
	date=models.DateTimeField(auto_now_add=True)


	def __str__(self):
		return str(self.user)+ ' '+str(self.date.date());

class Profile(models.Model):
	profile_id=models.AutoField(primary_key=True)
	user=models.ForeignKey(User,on_delete=models.CASCADE)
	profile_image=models.ImageField(upload_to="",default="default.png")
	follower=models.IntegerField(default=0)
	following=models.IntegerField(default=0)


	def __str__(self):
		return str(self.user)

class Like(models.Model):
	like_id=models.AutoField(primary_key=True)
	user=models.ManyToManyField(User,related_name='likingusers')
	post=models.OneToOneField(Post,on_delete=models.CASCADE)
	

	@classmethod
	def liked(cls,post,likinguser):
		obj,create=cls.objects.get_or_create(post=post)
		obj.user.add(likinguser)
		
	@classmethod
	def disliked(cls,post,dislikinguser):
		obj,create=cls.objects.get_or_create(post=post)
		obj.user.remove(dislikinguser)

	def __str__(self):
		return str(self.post)

class Follow(models.Model):
	follow_id=models.AutoField(primary_key=True)
	user=models.OneToOneField(User,on_delete=models.CASCADE)
	#that accounts which are current user want follow.
	following=models.ManyToManyField(User,related_name='following')
	#current user account followed by another user's account
	follower=models.ManyToManyField(User,related_name='follower')

	@classmethod
	def follow(cls,user,another_account):  #find the account with match old one,if not found than create object and add to the following object.
		obj,create=cls.objects.get_or_create(user=user)
		obj.following.add(another_account)
		print("followed")

	@classmethod
	def unfollow(cls,user,another_account):
		obj,create=cls.objects.get_or_create(user=user) #find the account with old one,and remove to the following list.
		obj.following.remove(another_account)
		print("unfollowed")

	def __str__(self):
		return str(self.user)	


class Comment(models.Model):
	comment_id=models.AutoField(primary_key=True)
	comment=models.TextField()
	user=models.ForeignKey(User,on_delete=models.CASCADE)
	post=models.ForeignKey(Post,on_delete=models.CASCADE)
	parent=models.ForeignKey('self',on_delete=models.CASCADE,null=True,related_name='parent_comment')
	timestamp=models.DateTimeField(default=now)

	def __str__(self):
		return self.comment[0:13] + "......." + self.user.username