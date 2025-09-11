from django.urls import path
from .views import ProjectListCreate,home

urlpatterns = [
    path('projects/', ProjectListCreate.as_view(), name='project-list'),
    path('',home,name='home'),
]