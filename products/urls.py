from django.conf.urls import url

from .views import *

urlpatterns = [
    url(r'^(?P<slug>[-.\w]+)/$', ProductDetail.as_view(), name='product'),
    url(r'^brand/(?P<slug>[-.\w]+)/$', BrandDetail.as_view(), name='brand'),
    url(r'^category/(?P<slug>[-.\w]+)/$', SubCategoryDetail.as_view(), name='subcategory'),
]
