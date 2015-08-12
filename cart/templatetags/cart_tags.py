from django import template

from ..cart import Cart

import datetime


register = template.Library()

@register.assignment_tag(takes_context=True)
def get_cart(context):
    request = context['request']
    cart = request.session['cart']

    print('cart', cart)

    return cart

@register.assignment_tag(takes_context=True)
def get_cart_count(context):
    request = context['request']
    cart = request.session['cart']

    return len(cart)
