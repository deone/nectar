from django.shortcuts import render, redirect
from django.http import HttpResponse

from .helpers import *

from products.models import Product

def index(request):
    context = {}
    return render(request, 'cart/index.html', context)

def add(request, id):
    cart = fetch_cart(request)

    product = Product.objects.get(id=id)
    product_dict = {product.pk: {'product_pk': product.pk, 'quantity': 1, 'product': to_dict(product)}}

    if cart:
        pk = str(product.pk)
        if pk in cart:
            cart[pk]['quantity'] += 1
        else:
            cart.update(product_dict)
    else:
        cart = product_dict

    request.session['cart'] = cart

    return redirect(request.META['HTTP_REFERER'])

def remove(request):
    pass
