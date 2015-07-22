from django.conf.urls import url

from .views import ProductList

urlpatterns = [
    url(r'^$', ProductList.as_view(), name='index'),
]
