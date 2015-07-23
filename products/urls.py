from django.conf.urls import url

from .views import ProductDetail

urlpatterns = [
    url(r'^(?P<pk>[0-9]+)/$', ProductDetail.as_view(), name='product'),
]
