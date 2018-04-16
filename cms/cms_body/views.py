from django import forms
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.forms import ModelForm
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import redirect, render
from django.urls import reverse, reverse_lazy
from django.views import View
from django.views.generic import (CreateView, DeleteView, DetailView, ListView,
                                  UpdateView)

from cms_body.forms import (AddUserForm, DocumentForm, DocumentSearchForm,
                            EditionSearchForm, GuestSearchForm, LoginForm)
from cms_body.models import Author, Document, Edition, Guest, Host


# INDEX


class IndexView(View):
    def get(self, request):
        ctx = {
            'editions': Edition.objects.all().order_by('-id')[0:10],
            'authors': Author.objects.all().order_by('-id')[0:10],
            'documents': Document.objects.all().order_by('-id')[0:10],
            'guests': Guest.objects.all().order_by('-id')[0:10],
            'hosts': Host.objects.all().order_by('-id')[0:10],

        }
        if request.user.is_authenticated:
            return render(request, "index.html", ctx)
        else:
            return redirect('user-login')


# AUTHOR


class AuthorCreateView(CreateView):
    model = Author
    fields = '__all__'
    success_url = reverse_lazy('authors')


class AuthorView(ListView):
    model = Author
    # template_name = 'cms_body/authors.html' # now - author_list.html


class AuthorUpdateView(UpdateView):
    model = Author
    fields = '__all__'
    # template_name_suffix = '_update_form' # now _form
    success_url = reverse_lazy('authors')


class AuthorDeleteView(DeleteView):
    model = Author
    success_url = reverse_lazy('authors')


class AuthorDetailView(DetailView):
    model = Author


# HOST


class HostDetailView(DetailView):
    model = Host


class HostListView(ListView):
    model = Host
    # template_name = 'cms_body/authors.html' # now - author_list.html


class HostCreateView(CreateView):
    model = Host
    fields = '__all__'
    success_url = reverse_lazy('hosts')


# GUEST


class GuestCreateView(CreateView):
    model = Guest
    fields = '__all__'
    success_url = reverse_lazy('guests')


class GuestListView(View):
    def get(self, request):
        ctx = {
            'guests': Guest.objects.all().order_by('-id')[0:20],
            'form': GuestSearchForm,
        }
        return render(request, 'guest_list.html', ctx)

    def post(self, request):
        form = GuestSearchForm(request.POST)
        if form.is_valid():
            gosc = form.cleaned_data['gosc']
            name = Guest.objects.filter(name__icontains=gosc).order_by('-id')
            surname = Guest.objects.filter(surname__icontains=gosc).order_by('-id')
            notatki = Guest.objects.filter(notes__icontains=gosc).order_by('-id')
            ctx = {
                'guests': Guest.objects.all().order_by('-id')[0:20],
                'form': form,
                'name': name,
                'surname': surname,
                'notatki': notatki,
                'wyniki': True
            }
            return render(request, 'guest_list.html', ctx)

        ctx = {
            'guests': Guest.objects.all().order_by('-id')[0:20],
            'form': form,
        }
        return render(request, 'guest_list.html', ctx)


class GuestDetailView(DetailView):
    model = Guest


# EDITION


class DateInput(forms.DateInput):
    input_type = 'date'


class EditionCreateView(CreateView):
    model = Edition
    fields = '__all__'
    success_url = reverse_lazy('editions')

    def get_form(self):
        # add date picker in forms
        from django.forms.widgets import SelectDateWidget
        form = super(EditionCreateView, self).get_form()
        form.fields['date'].widget = SelectDateWidget()
        return form


class EditionListView(View):
    def get(self, request):
        ctx = {
            'editions': Edition.objects.all().order_by('-id')[0:20],
            'form': EditionSearchForm,
        }
        return render(request, 'edition_list.html', ctx)

    def post(self, request):
        form = EditionSearchForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data['data']
            try:
                edition = Edition.objects.get(date=data)
            except:
                edition = None
            ctx = {
                'form': form,
                'edition': edition,
                'editions': Edition.objects.all().order_by('-id')[0:20],

            }
            return render(request, 'edition_list.html', ctx)

        ctx = {
            'editions': Edition.objects.all().order_by('-id')[0:20],
            'form': form,
        }
        return render(request, 'edition_list.html', ctx)


class EditionUpdateView(UpdateView):
    model = Edition
    fields = '__all__'
    success_url = reverse_lazy('editions')

    def get_form(self):
        '''add date picker in forms'''
        from django.forms.widgets import SelectDateWidget
        form = super(EditionUpdateView, self).get_form()
        form.fields['date'].widget = SelectDateWidget()
        return form


class EditionDeleteView(DeleteView):
    model = Edition
    success_url = reverse_lazy('editions')


class EditionDetailView(DetailView):
    model = Edition


# DOCUMENT


class AddDocument(View):
    def get(self, request):
        ctx = {
            'form': DocumentForm,
            'naglowek': "Dodaj dokumentację",
        }
        return render(request, "add_document.html", ctx)

    def post(self, request):
        form = DocumentForm(request.POST)
        if form.is_valid():
            # content = form.cleaned_data['content']
            form.save()
            # return HttpResponse('Dodano gościa {}'.format(name))
            return HttpResponseRedirect(reverse('documents'))
        ctx = {
            'form': form,
            'naglowek': "Dodaj dokumentację",
        }
        return render(request, "add_document.html", ctx)


class UpdateDocumentView(View):
    def get(self, request, pk):
        document = Document.objects.get(pk=pk)
        guests = Guest.objects.all().filter(documents=pk)
        form = DocumentForm(instance=document)
        ctx = {
            'form': form,
            'guests': guests,
            'naglowek': "Zmień dokumentację",
        }
        return render(request, "add_document.html", ctx)

    def post(self, request, pk):
        document = Document.objects.get(pk=pk)
        form = DocumentForm(request.POST, instance=document)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(
                reverse('documents')
            )


class DocumentListView(View):
    def get(self, request):
        ctx = {
            'documents': Document.objects.all().order_by('-id')[0:20],
            'form': DocumentSearchForm,
        }
        return render(request, 'document_list.html', ctx)

    def post(self, request):
        form = DocumentSearchForm(request.POST)
        if form.is_valid():
            slowo = form.cleaned_data['slowo']
            data = form.cleaned_data['data']
            # print(data)
            topic = Document.objects.filter(topic__icontains=slowo).order_by('-id')
            lead = Document.objects.filter(lead__icontains=slowo).order_by('-id')
            content = Document.objects.filter(content__icontains=slowo).order_by('-id')
            try:
                edition = Edition.objects.get(date=data)
            except:
                edition = None
            ctx = {
                'form': form,
                'edition': edition,
                'content': content,
                'lead': lead,
                'topic': topic,
                'documents': Document.objects.all().order_by('-id')[0:20],
                'wyniki': None
            }
            return render(request, 'document_list.html', ctx)

        ctx = {
            'guests': Document.objects.all().order_by('-id')[0:20],
            'form': form,
        }
        return render(request, 'document_list.html', ctx)


class DocumentDetailView(DetailView):
    model = Document


# USER

class AddUserView(View):
    def get(self, request):
        ctx = {
            'form': AddUserForm,
        }
        return render(request, 'add_user_form.html', ctx)

    def post(self, request):
        form = AddUserForm(request.POST)
        if form.is_valid():
            # create_user - HASLA HASZOWANE
            user = User.objects.create_user(username=form.cleaned_data['username'],
                                            password=form.cleaned_data['password'],
                                            first_name=form.cleaned_data['first_name'],
                                            last_name=form.cleaned_data['last_name'],
                                            email=form.cleaned_data['email'])
            # SZYBSZE z usunieciem nieptrzebnego pola
            # del form.cleaned_data['password_c'] albo
            # form.cleaned_data.pop('password_c')
            # user = User.objects.create_user(**form.cleaned_data)

            # ZROBIC USER ADDED DELETED MODIFICATED TEMPLATE!

            return HttpResponse('DODANO! usera o id {}'.format(user.id))

        ctx = {
            'form': form,
        }
        return render(request, 'add_user_form.html', ctx)


class UserLoginView(View):
    def get(self, request):
        ctx = {
            'form': LoginForm,
        }
        return render(request, 'login_form.html', ctx)

    def post(self, request):
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(username=username, password=password)
            if user:
                login(request, user)
                url = request.GET.get('next')
                if url:
                    return redirect(url)
                return redirect('index')

            form.add_error(field=None, error='Zły login lub hasło')

        ctx = {
            'form': form,
        }
        return render(request, 'login_form.html', ctx)


class UserLogoutView(View):
    def get(self, request):
        logout(request)
        # return HttpResponse('Wylogowano')
        return redirect('user-login')
