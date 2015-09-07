from .models import *
from products.models import Product

def fetch_cart(request):
    try:
        cart = request.session['cart']
    except:
        cart = None

    return cart

def to_dict(product):
    return {
        'product_pk': product.pk,
        'name': product.name,
        'code': product.code,
        'brand': product.subcategory.brand.name,
        'image': product.image.url
    }

def create_cart(cart_session_obj, customer_info):
    cart = Cart(**customer_info)
    cart.save()
    for k, v in cart_session_obj.items():
        product = Product.objects.get(pk=k)
        quantity = v['quantity']
        LineItem.objects.create(cart=cart, product=product, quantity=quantity)

    return cart
