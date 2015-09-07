from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings

from .helpers import *
from .forms import RequestQuoteForm

from products.models import Product
from contact.helpers import send_email

def index(request):
    if request.method == 'POST':
        form = RequestQuoteForm(request.POST)
        if form.is_valid():
            customer_info = {
                'business_name': form.cleaned_data['business_name'],
                'account_number': form.cleaned_data['account_number'],
                'contact_name': form.cleaned_data['contact_name'],
                'contact_number': form.cleaned_data['contact_number'],
                'contact_email': form.cleaned_data['contact_email'],
                'delivery_method': form.cleaned_data['delivery_method']
            }
            cart = create_cart(request.session['cart'], customer_info)
            customer_info['items'] = [item.to_dict() for item in cart.lineitem_set.all()]
            if cart:
                send_email(settings.QUOTE_REQUEST_SUBJECT, customer_info, 'cart/quote_request_email.html')
    else:
        form = RequestQuoteForm()
    context = {'form': form}
    return render(request, 'cart/index.html', context)

def add(request, id):
    cart = fetch_cart(request)

    product = Product.objects.get(id=id)
    product_dict = {product.pk: {'product_pk': product.pk, 'quantity': 1, 'product': product.to_dict()}}

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
