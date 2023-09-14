from .models import Category,Cart

def add_variable_to_context(request):
	category = Category.objects.all()

	return {'cat': category}