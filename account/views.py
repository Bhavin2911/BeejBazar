from django.shortcuts import render,HttpResponse,redirect,HttpResponseRedirect
from django.contrib import messages
from .models import User
from django.contrib.auth import authenticate,login,logout
from django.core.mail import send_mail, BadHeaderError
from django.contrib.auth.forms import PasswordResetForm
from django.template.loader import render_to_string
from django.db.models.query_utils import Q
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes

# Create your views here.

def registration(request):
	return render(request, 'registration.html')

def log(request):
	log.return_url = None
	log.return_url = request.GET.get('return_url')
	return render(request, 'login.html')

def handleregi(request):
	if request.method == 'POST':
		fname = request.POST['fname']
		lname = request.POST['lname']
		username = request.POST['username']
		email = request.POST['email']
		pass1 = request.POST['pass1']
		pass2 = request.POST['pass2']
		mo = request.POST['mo']
		state = request.POST['state']
		district = request.POST['district']
		city = request.POST['city']

		value = {
			'fname' :fname,
			'lname' :lname,
			'username' :username,
			'email' :email,
			'mo' :mo,
			'state' :state,
			'district' :district,
			'city' :city,
		}		

		if User.objects.filter(username=username).exists():
			messages.error(request,'Username already taken')
			return render(request,'registration.html',{'value':value})		

		elif len(username)>25 and len(username)<5:
			messages.error(request,"username must be less than 25 characters or greater than 5 characters ")
			return render(request,'registration.html',{'value':value})		

		elif len(mo)>11:
			messages.error(request, 'phone number is not valid ')
			return render(request,'registration.html',{'value':value})

		elif User.objects.filter(email=email).exists():
			messages.error(request, 'Email already taken')
			return render(request,'registration.html',{'value':value})		
				
		elif pass1 != pass2:
			messages.error(request,"password do not match")
			return render(request,'registration.html',{'value':value})
		else:	
			myuser = User.objects.create_user(username=username,password=pass1,email=email,first_name=fname,last_name=lname,User_mo=mo,State=state,District=district,City=city)
			myuser.save()
			messages.success(request,"Your account has been successfully created")						
			return redirect('log')

	else:
		return HttpResponse('404 - Not Found')

def handlelog(request):
	if request.method == 'POST':
		loginusername = request.POST['loginusername']
		loginpassword = request.POST['loginpassword']
		
		user = 	authenticate(username=loginusername,password=loginpassword)
				
		if user is not None:
			login(request,user)
			messages.success(request,"Successfully Logged In")
			
			if log.return_url:
				return HttpResponseRedirect(log.return_url)
			else:
				log.return_url = None
				return redirect('/')
		else:
			messages.error(request,"Invalid Credentials , Please Try Again")
			return redirect('log')
				
	return HttpResponse('404 - Not Found')		

def handlelgout(request):
	logout(request)
	messages.success(request,"Successfully Logged Out")
	return redirect('/')


def password_reset_request(request):
	if request.method == "POST":
		password_reset_form = PasswordResetForm(request.POST)
		if password_reset_form.is_valid():
			data = password_reset_form.cleaned_data['email']
			associated_users = User.objects.filter(Q(email=data))
			if associated_users.exists():
				for user in associated_users:
					subject = "Password Reset Requested"
					email_template_name = "password_reset/password_reset_email.txt"
					c = {
					"email":user.email,
					'domain':'127.0.0.1:8000',
					'site_name': 'BeejBazaar',
					"uid": urlsafe_base64_encode(force_bytes(user.pk)),
					"user": user,
					'token': default_token_generator.make_token(user),
					'protocol': 'http',
					}
					email = render_to_string(email_template_name, c)
					try:
						send_mail(subject, email, 'bhavinasodariya2911@gmail.com' , [user.email], fail_silently=False)
					except BadHeaderError:
						return HttpResponse('Invalid header found.')
					messages.success(request, 'A message with reset password instructions has been sent to your inbox.')	
					return redirect ("/password_reset/done/")
			messages.error(request, 'An invalid email has been entered.')		
	password_reset_form = PasswordResetForm()
	return render(request=request, template_name="password_reset/password_reset.html", context={"password_reset_form":password_reset_form})

	