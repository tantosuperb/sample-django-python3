from django.contrib import admin
from django.urls import path

from .views import member_details, member_create_read_all

urlpatterns = [
  path('', member_create_read_all),
  path('<int:id>/', member_details),
]