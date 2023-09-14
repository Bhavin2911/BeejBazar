from django.urls import path
from . import views


urlpatterns=[
		path('',views.Home,name='Home'),
		path('handle_post',views.Handle_post,name='Handle_post'),	
		path('like_dislike_post',views.Likepost,name='like_dislike_post'),
		path('<int:postid>',views.Del_post,name='del_post'),	
		path('postcomment/<int:comm_id>',views.postcomment,name='postcomment'),#on clicked comment button.
		path('handle_comment',views.handle_comment,name='handle_comment'), #to handle comment.	
		path('<str:username>',views.User_profile,name='user_profile'),
		path('my_post/<str:username>',views.my_post,name='my_post'),
		path('user/follow/<str:username>',views.follow,name='follow'),
		path('edit_profile/<str:username>',views.edit_profile,name='editprofile'),
		path('handle_edit/<str:username>',views.handle_edit,name='handle_edit'),
		]