from django.conf.urls import url

from .views import ProductDetail

urlpatterns = [
    url(r'^(?P<slug>[-.\w]+)/$', ProductDetail.as_view(), name='product'),
]
