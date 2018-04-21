from django.contrib import admin
from django.contrib.auth import get_user_model
from cms_body.models import Document, Edition, Guest, Host

User = get_user_model()


@admin.register(User)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ["username", "first_name", "last_name", "phone"]


@admin.register(Host)
class HostAdmin(admin.ModelAdmin):
    list_display = ["name", "surname", "phone"]


@admin.register(Guest)
class GuestAdmin(admin.ModelAdmin):
    list_display = ["name", "surname", "phone"]


@admin.register(Edition)
class EditionAdmin(admin.ModelAdmin):
    list_display = ["date"]


@admin.register(Document)
class DocumentAdmin(admin.ModelAdmin):
    list_display = ["topic", "edition", "author"]
    filter_horizontal = ['guests']
