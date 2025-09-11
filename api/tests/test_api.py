import pytest
from django.urls import reverse
from rest_framework.test import APIClient
from api.models import Project

@pytest.mark.django_db
def test_project_list():
    client = APIClient()
    Project.objects.create(title="Test Project", description="Testing")
    response = client.get(reverse('project-list'))
    assert response.status_code == 200
    assert len(response.data) == 1
