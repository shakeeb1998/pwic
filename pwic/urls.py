from django.urls import path

from pwic.views import homePageView

app_name = 'pwic'


urlpatterns = [
    path('hello_world/', homePageView, name="detail"),


]