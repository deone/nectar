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

def remove(request, id):
    cart = fetch_cart(request)

    id = str(id)
    if cart:
        if id in cart:
            del cart[id]

    request.session['cart'] = cart

    return redirect(request.META['HTTP_REFERER'])

def set_quantity(request, id):
    quantity = int(request.POST['quantity'])
    if quantity < 0:
        raise ValueError('Quantity must be positive when updating cart')

    id = str(id)
    cart = fetch_cart(request)

    if id in cart.keys():
        cart[id]['quantity'] = quantity
        if cart[id]['quantity'] < 1:
            del cart[id]
        request.session['cart'] = cart

    return redirect('cart:index')
