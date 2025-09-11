from django.shortcuts import render
from rest_framework import generics 
from .models import Project
from .serializers import ProjectSerializer

class ProjectListCreate(generics.ListCreateAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer

def home(request):
    return render(request, 'home.html')


# Create your views here.
