from django.views.generic import ListView

from .models import Product

class ProductList(ListView):
    model = Product
    template_name = 'products/index.html'
    context_object_name = 'new_products'
