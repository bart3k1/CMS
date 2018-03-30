from django.contrib import admin

# Register your models here.
from cms_body.models import Author, Host, Guest, Edition, Document


@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ("surname", "name", "phone")


@admin.register(Host)
class HostAdmin(admin.ModelAdmin):
    list_display = ("name", "surname", "phone")


@admin.register(Guest)
class GuestAdmin(admin.ModelAdmin):
    list_display = ("name", "surname", "phone")


@admin.register(Edition)
class GuestAdmin(admin.ModelAdmin):
    list_display = ("date",)


@admin.register(Document)
class DocumentAdmin(admin.ModelAdmin):
    list_display = ("topic", "edition", "author")
    filter_horizontal = ['guests']