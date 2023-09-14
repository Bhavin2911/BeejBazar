from django.shortcuts import render,HttpResponse,redirect
from django.contrib import messages
from account.models import User
from .models import Post,Profile,Like,Follow,Comment
from socialmedia.templatetags import extras
import json
from middlewares.auth import auth_middleware

@auth_middleware 
def Home(request):
	post=Post.objects.all().order_by('-pk')
	liked_post=[]
	for i in post:
		is_liked=Like.objects.filter(post=i,user=request.user)
		if is_liked:
			liked_post.append(i)


	post={'posts':post,'liked_post':liked_post}
	return render(request,'Socialmedia/AddPost.html',post)

def Handle_post(request):
	if request.method=="POST":
		img=request.FILES['image']
		obt_caption=request.POST.get('caption','')
		user=request.user
		post_obj=Post(image=img,caption=obt_caption,user=user)
		post_obj.save()
		messages.success(request,'Posted successfully.')
		return redirect('/socialmedia')
	else:
		messages.danger(request,'Something went wrong !!')
		return redirect('/socialmedia')
	return render(request,'Socialmedia/AddPost.html')


def User_profile(request,username):
	user=User.objects.filter(username=username)
	if user:
		user=user[0]
		profile=Profile.objects.get(user=user)
		post=getpost(user)
		profile_image=profile.profile_image
		#the user is followed by the logged in user and obtained that data from the database.
		is_following=Follow.objects.filter(user=request.user,following=user)
		#get object from the database to show following and follower.		
		following_obj=Follow.objects.get(user=user)
		following_user=following_obj.following.count()
		follower_user=following_obj.follower.count()
		# print(profile_image)
		data = {
				'user_obj':user,
				'profile_image':profile_image,
				'posts':post,
				'connection':is_following, #send data to template of line no:- 41
				'following_users':following_user,
				'follower_users':follower_user		
			   } 

	else:
		 return HttpResponse('No such user!!!')
		 
	return render(request,'Socialmedia/userprofile.html',data)	 

def my_post(request,username):
	user=User.objects.filter(username=username)
	if user:
		user=user[0]
		profile=Profile.objects.get(user=user)
		post=getpost(user)
		data = {
				'user_obj':user,
				'posts':post,
			   }

	else:
		 return HttpResponse('No such user!!!')
			 
	return render(request,'Socialmedia/mypost.html',data)	 


def getpost(user):
	mypost=Post.objects.filter(user=user)
	return mypost

def Del_post(request,postid):
	post_=Post.objects.filter(pk=postid)
	post_.delete()
	messages.success(request,'Post deleted successfully.')
	return render(request,'Socialmedia/userprofile.html')


def Likepost(request):
	p_id=request.GET.get("likeid","")

	post=Post.objects.get(pk=p_id)
	user=request.user
	liker=Like.objects.filter(post=post,user=user)
	likes=False   #for track like status.
	# print(liker)
	if liker:
		Like.disliked(post,user)
	else:
		likes=True
		Like.liked(post,user)

	# likec=liker.count()
	# print(likec)
	resp={'likes':likes}
	response=json.dumps(resp)  #json.dumps() converted into string because a string representing the MIME type of the request,parsed from the CONTENT_TYPE header.
	return HttpResponse(response,content_type='application/json')


def follow(request,username):
	main_user=request.user
	to_follow=User.objects.get(username=username) #logged in user want to follow.
	#check if already following.
	followings=Follow.objects.filter(user=main_user,following=to_follow)
	#for track follow status.
	is_following=True if followings else False  #is_following true when followings has any object else is_following false.
	
	if is_following:
		#unfollow the user.
		Follow.unfollow(main_user,to_follow)
		is_following=False
	else:
		Follow.follow(main_user,to_follow)
		is_following=True
		
	resp={"isfollowing":is_following}
	response=json.dumps(resp) #json.dumps() converted into string because a string representing the MIME type of the request,parsed from the CONTENT_TYPE header.
	return HttpResponse(response,content_type='application/json')

def postcomment(request,comm_id): #we have gain filtered object through slug variable(post_id) clicked on comment button.
	post_comment=Post.objects.filter(post_id=comm_id).first() #filtered post object to posted comment.
	comments=Comment.objects.filter(post_id=post_comment,parent=None)
	replies=Comment.objects.filter(post_id=post_comment).exclude(parent=None)

	replyDict={}
	for reply in replies:
		if reply.parent.comment_id not in replyDict.keys():
			replyDict[reply.parent.comment_id] = [reply]
		else:
			replyDict[reply.parent.comment_id].append(reply)

	comment_data={'post_comment':post_comment,'comments':comments,'user':request.user,'replyDict':replyDict}
	return render(request,'Socialmedia/postcomment.html',comment_data)

def handle_comment(request):
	comment=request.POST.get("comment")
	user=request.user
	p_id=request.POST.get("pid")#postid fetched from parent comment form.go to the line number:- 13 of postcomment.html
	post_obj=Post.objects.get(post_id=p_id)
	parentsno=request.POST.get('parentsno')
	# print(parentsno)
	if parentsno=="":
		comment=Comment(comment=comment,user=user,post=post_obj)
		comment.save()
		messages.success(request,'Your comment posted successfully.')
	else:
		parent=Comment.objects.get(comment_id=parentsno)
		# print(parent,comment,user,post_obj)
		comment=Comment(comment=comment,user=user,post=post_obj,parent=parent)
		comment.save()
		messages.success(request,'Your reply  posted successfully.')
	return redirect(f'/socialmedia/postcomment/{post_obj.post_id}')

def edit_profile(request,username):
	for_edit=User.objects.filter(username=username).first()
	for_profile=Profile.objects.get(user=for_edit)
	# print(for_profile)
	return render(request,'Socialmedia/EditProfile.html',{'for_profile':for_profile})

def handle_edit(request,username):
	user=User.objects.get(username=username)
	pro=Profile.objects.get(user=request.user)
	# print(pro.profile_image.url)

	if request.method=='POST':
		img=request.FILES['p_image']
		firstname=request.POST.get('edit_firstname','')
		lastname=request.POST.get('edit_lastname','')
		username=request.POST.get('edit_username','')
		phone_no=request.POST.get('edit_phoneno','')
		email=request.POST.get('edit_email','')
		city=request.POST.get('edit_city','')
		state=request.POST.get('edit_state','')
		district=request.POST.get('edit_district','')

		pro.profile_image=img
		# print(pro.profile_image.url)
		pro.save()

		user.first_name=firstname
		user.last_name=lastname
		user.username=username
		user.User_mo=phone_no
		user.email=email
		user.City=city
		user.State=state
		user.district=district
		user.save()

		
		messages.success(request,'Profile edited successfully.')
		return redirect('/socialmedia')
	else:
		messages.error(request,'Something went wrong.')
		return redirect(f'/socialmedia')