
"""cms URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url

from cms_body.views import AuthorCreateView, AuthorUpdateView, AuthorDeleteView, AuthorDetailView, AuthorView


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^create_author/$', AuthorCreateView.as_view(), name='create-author'),
    url(r'^update_author/(?P<pk>\d+)/$', AuthorUpdateView.as_view(), name='update-author'),
    url(r'^delete_author/(?P<pk>\d+)/$', AuthorDeleteView.as_view(), name='delete-author'),
    url(r'^detail_author/(?P<pk>\d+)/$', AuthorDetailView.as_view(), name='author-detail'),
    url(r'^authors/$', AuthorView.as_view(), name='authors'),


]
