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
        'brand': product.subcategory.brand.name
    }
