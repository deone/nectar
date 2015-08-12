from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^add/(?P<id>[0-9]+)/$', views.add, name='item-add'),
    url(r'^remove/(?P<id>[0-9]+)/$', views.remove, name='item-remove'),
    url(r'^setqty/(?P<id>[0-9]+)/$', views.set_quantity, name='item-set-qty'),
]
