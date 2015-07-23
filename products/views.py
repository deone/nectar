from django.views.generic import ListView, DetailView

from .models import Product

class ProductList(ListView):
    queryset = Product.objects.all()
    template_name = 'products/index.html'
    context_object_name = 'new_products'

class ProductDetail(DetailView):
    model = Product
    template_name = 'products/detail.html'

    def get_context_data(self, **kwargs):
        context = super(ProductDetail, self).get_context_data(**kwargs)
        # related products
        context['related_products'] = Product.objects.all()
        return context
