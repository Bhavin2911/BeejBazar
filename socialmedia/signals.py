from django.db.models.signals import post_save,m2m_changed
from django.dispatch import receiver
from account.models import User
from socialmedia.models import Profile,Follow

@receiver(post_save,sender=User)
def create_profile(sender,instance,created,**kwargs):
	if created:
		Profile.objects.create(user=instance) #when create user object automatically create profile objcet and filled to user(user field) of profile model
		Follow.objects.create(user=instance) #when create user object automatically create Follow  objcet and filled to user(user field) of Follow model	
											#instance is object that is send by User model of creation time.
@receiver(m2m_changed,sender=Follow.following.through)
def add_follower(sender,instance,action,reverse,pk_set,**kwargs):
	followed_users = []
	logged_user = User.objects.get(username = instance)
	for i in pk_set:
		user = User.objects.get(pk = i)
		following_obj = Follow.objects.get(user=user)
		followed_users.append(following_obj)

	if action == "pre_add":
		for i in followed_users:
			i.follower.add(logged_user)	
			i.save()

	if action == "pre_remove":
		for i in followed_users:
			i.follower.remove(logged_user)	
			i.save()