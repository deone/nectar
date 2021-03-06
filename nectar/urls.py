"""nectar URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf import settings
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic import TemplateView

from products.views import ProductList, CategoryList, BrandList
from contact.views import index

urlpatterns = [
    url(r'^$', ProductList.as_view(), name='index'),
    url(r'^our-team/', TemplateView.as_view(template_name="team.html"), name="our-team"),
    url(r'^services/', TemplateView.as_view(template_name="services.html"), name="services"),
    url(r'^news/', TemplateView.as_view(template_name="news.html"), name="news"),
    url(r'^brands/', BrandList.as_view(), name="brands"),
    url(r'^product-lines/', CategoryList.as_view(), name="product-lines"),
    url(r'^careers/', TemplateView.as_view(template_name="careers.html"), name="careers"),
    url(r'^contact-us/', index, name="contact-us"),
    url(r'^how-to-order/', TemplateView.as_view(template_name="how_to_order.html"), name="how-to-order"),
    url(r'^nectar-academy/', TemplateView.as_view(template_name="academy.html"), name="academy"),
    url(r'^cart/', include('cart.urls', namespace="cart")),
    url(r'^products/', include('products.urls', namespace="products")),
    url(r'^admin/', include(admin.site.urls)),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
