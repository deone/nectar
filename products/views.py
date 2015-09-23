from django.views.generic import ListView, DetailView

from .models import *

class ProductList(ListView):
    queryset = Product.objects.all()
    context_object_name = 'new_products'

    def get_context_data(self, **kwargs):
        context = super(ProductList, self).get_context_data(**kwargs)
        return context

class ProductDetail(DetailView):
    model = Product
    context_object_name = 'product'

    def get_context_data(self, **kwargs):
        context = super(ProductDetail, self).get_context_data(**kwargs)
        context['related_products'] = Product.objects.exclude(pk=self.get_object().pk)[:4]
        return context

class SubCategoryDetail(DetailView):
    model = SubCategory

    def get_context_data(self, **kwargs):
        context = super(SubCategoryDetail, self).get_context_data(**kwargs)
        subcategory = self.get_object()
        context['products'] = Product.objects.filter(subcategory=subcategory)
        return context

class BrandDetail(DetailView):
    model = Brand

    def get_context_data(self, **kwargs):
        context = super(BrandDetail, self).get_context_data(**kwargs)
        brand = self.get_object()
        context['products'] = Product.objects.filter(subcategory__brand=brand)
        return context

class CategoryList(ListView):
    model = Category
    context_object_name = 'categories'

    def get_context_data(self, **kwargs):
        context = super(CategoryList, self).get_context_data(**kwargs)
        return context

class BrandList(ListView):
    model = Brand
    context_object_name = 'brands'

    def get_context_data(self, **kwargs):
        context = super(BrandList, self).get_context_data(**kwargs)
        return context
