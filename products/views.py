from django.views.generic import ListView, DetailView

from .models import *

class ProductList(ListView):
    queryset = Product.objects.all()
    context_object_name = 'new_products'

class ProductDetail(DetailView):
    model = Product
    context_object_name = 'product'

    def get_context_data(self, **kwargs):
        context = super(ProductDetail, self).get_context_data(**kwargs)
        context['related_products'] = Product.objects.all()[:4]
        return context

class SubCategoryDetail(DetailView):
    model = SubCategory

    def get_context_data(self, **kwargs):
        context = super(SubCategoryDetail, self).get_context_data(**kwargs)
        context['products'] = Product.objects.all()
        return context

class BrandDetail(DetailView):
    model = Brand

    def get_context_data(self, **kwargs):
        context = super(BrandDetail, self).get_context_data(**kwargs)
        context['products'] = Product.objects.all()
        return context
