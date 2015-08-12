class CartItem(object):
    
    def __init__(self, product, quantity):
        self.product = product
        self.quantity = quantity

    def to_dict(self):
        return {
            'product_pk': self.product.pk,
            'quantity': self.quantity,
        }

class Cart(object):

    def __init__(self, session):
        self._items_dict = {}
        self.session = session

    def add(self, product, quantity=1):
        if product in self.products:
            self._items_dict[product.pk].quantity += quantity
        else:
            self._items_dict[product.pk] = CartItem(product, quantity)
        self.update_session()

    def update_session(self):
        self.session = self.cart_serializable
        self.session.modified = True

    @property
    def cart_serializable(self):
        cart_representation = {}
        for item in self.items:
            product_id = str(item.product.pk)
            cart_representation[product_id] = item.to_dict()
        return cart_representation

    @property
    def products(self):
        return [item.product for item in self.items]
