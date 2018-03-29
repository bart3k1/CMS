from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse, reverse_lazy
from cms_body.models import Author, Host, Guest, Edition
from django.views import View
from django.views.generic import CreateView, DeleteView, ListView, UpdateView, DetailView

# Create your views here.


class AuthorCreateView(CreateView):
    model = Author
    fields = '__all__'
    success_url = reverse_lazy('authors')


class AuthorView(ListView):
    model = Author
    # template_name = 'exercises/hosts_list.html' #nie trzeba jesli takie jak standardowe hosts_list.html


class AuthorUpdateView(UpdateView):
    model = Author
    fields = '__all__'
    # template_name_suffix = '_update_form'
    success_url = reverse_lazy('authors')


class AuthorDeleteView(DeleteView):
    model = Author
    success_url = reverse_lazy('authors')


class AuthorDetailView(DetailView):
    model = Author


class EditionCreateView(CreateView):
    model = Edition
    fields = '__all__'
    success_url = reverse_lazy('editions')


class EditionView(ListView):
    model = Edition


class EditionUpdateView(UpdateView):
    model = Edition
    fields = '__all__'
    success_url = reverse_lazy('editions')


class EditionDeleteView(DeleteView):
    model = Edition
    success_url = reverse_lazy('editions')


class EditionDetailView(DetailView):
    model = Edition