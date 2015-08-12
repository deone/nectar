from django import template

from ..helpers import fetch_cart

import datetime


register = template.Library()


@register.assignment_tag(takes_context=True)
def get_cart(context):
    request = context['request']
    cart = fetch_cart(request)

    return cart

@register.assignment_tag(takes_context=True)
def get_cart_count(context):
    request = context['request']

    cart = fetch_cart(request)

    if cart is None:
        return 0
    else:
        return len(cart)
