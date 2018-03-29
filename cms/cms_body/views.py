from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse, reverse_lazy
from cms_body.models import Author, Host, Guest, Edition, Document
from django.views import View
from django.views.generic import CreateView, DeleteView, ListView, UpdateView, DetailView
from cms_body.forms import DocumentForm

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


class DocumentCreateView(CreateView):
    model = Document
    fields = '__all__'


class AddDocument(View):
    def get(self, request):
        ctx = {
            'form': DocumentForm,
        }
        return render(request, "add_document.html", ctx)

    def post(self, request):
        form = DocumentForm(request.POST)
        if form.is_valid():
            content = form.cleaned_data['content']
            form.save()
            # return HttpResponse('Dodano gościa {}'.format(name))
            return HttpResponseRedirect(reverse('documents'))


        # BLEDY ... jesli if nei pojdzie to bledy w formie sie wyswietla
        ctx = {
            'form': form,
        }
        return render(request, "add_document.html", ctx)


class DocumentView(ListView):
    model = Document