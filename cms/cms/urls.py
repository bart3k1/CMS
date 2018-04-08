
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
from django.conf.urls import include

from cms_body.views import (
    AuthorCreateView,
    AuthorUpdateView,
    AuthorDeleteView,
    AuthorDetailView,
    AuthorView,
    EditionCreateView,
    EditionView,
    EditionDetailView,
    EditionDeleteView,
    EditionUpdateView,
    DocumentCreateView,
    AddDocument,
    DocumentView,
    DocumentUpdateView,
    UserLoginView,
    UserLogoutView,
    IndexView,
    HostDetailView,
    GuestDetailView,
    DocumentDetailView,
    AddUserView,
    UpdateDocumentView,
    SearchGuestView,
    GuestListView,
    GuestCreateView,
    HostListView)


urlpatterns = [
    url(r'^tinymce/', include('tinymce.urls')),
    url(r'^select2/', include('django_select2.urls')),

    url(r'^admin/', admin.site.urls),
    url(r'^index/', IndexView.as_view(), name='index'),
    url(r'^add_user/$', AddUserView.as_view(), name='add-user'),
    url(r'^user_login/$', UserLoginView.as_view(), name='user-login'),
    url(r'^logout/$', UserLogoutView.as_view(), name='logout'),


    url(r'^create_author/$', AuthorCreateView.as_view(), name='create-author'),
    url(r'^update_author/(?P<pk>\d+)/$', AuthorUpdateView.as_view(), name='update-author'),
    url(r'^delete_author/(?P<pk>\d+)/$', AuthorDeleteView.as_view(), name='delete-author'),
    url(r'^detail_author/(?P<pk>\d+)/$', AuthorDetailView.as_view(), name='author-detail'),
    url(r'^authors/$', AuthorView.as_view(), name='authors'),

    url(r'^detail_host/(?P<pk>\d+)/$', HostDetailView.as_view(), name='host-detail'),
    url(r'^hosts/$', HostListView.as_view(), name='hosts'),

    url(r'^detail_guest/(?P<pk>\d+)/$', GuestDetailView.as_view(), name='guest-detail'),
    url(r'^search_guest/$', SearchGuestView.as_view(), name='search-guest'),
    url(r'^list_guest/$', GuestListView.as_view(), name='guests'),
    url(r'^create_guest/$', GuestCreateView.as_view(), name='create-guest'),

    url(r'^create_edition/$', EditionCreateView.as_view(), name='create-edition'),
    url(r'^update_edition/(?P<pk>\d+)/$', EditionUpdateView.as_view(), name='update-edition'),
    url(r'^delete_edition/(?P<pk>\d+)/$', EditionDeleteView.as_view(), name='delete-edition'),
    url(r'^detail_edition/(?P<pk>\d+)/$', EditionDetailView.as_view(), name='edition-detail'),
    url(r'^editions/$', EditionView.as_view(), name='editions'),

    url(r'^create_document/$', DocumentCreateView.as_view(), name='create-document'),
    url(r'^update_document1/(?P<pk>\d+)/$', DocumentUpdateView.as_view(), name='update-document1'),
    url(r'^update_document/(?P<pk>\d+)/$', UpdateDocumentView.as_view(), name='update-document'),
    url(r'^add_document/$', AddDocument.as_view(), name='add-document'),
    url(r'^detail_document/(?P<pk>\d+)/$', DocumentDetailView.as_view(), name='document-detail'),
    url(r'^documents/$', DocumentView.as_view(), name='documents'),



]
