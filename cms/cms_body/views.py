from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse, reverse_lazy
from cms_body.models import Author, Host, Guest, Edition, Document
from django.views import View
from django.views.generic import CreateView, DeleteView, ListView, UpdateView, DetailView
from cms_body.forms import DocumentForm, LoginForm, AddUserForm, SearchForm


# INDEX


class IndexView(View):
    def get(self, request):
        ctx = {
            'editions': Edition.objects.all(),
            'authors': Author.objects.all(),
            'documents': Document.objects.all(),
            'guests': Guest.objects.all(),
            'hosts': Host.objects.all(),

        }
        return render(request, "index.html", ctx)

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

# GUEST


class GuestDetailView(DetailView):
    model = Guest


class SearchGuestView(View):
    def get(self, request):
        ctx = {
            'form': SearchForm,
        }
        return render(request, 'search.html', ctx)

    def post(self, request):
        form = SearchForm(request.POST)
        if form.is_valid():
            gosc = form.cleaned_data['gosc']
            name = Guest.objects.filter(name__icontains=gosc)
            surname = Guest.objects.filter(surname__icontains=gosc)
            # print(categories)
            ctx = {
                'form': SearchForm,
                'name': name,
                'surname': surname,
                'wyniki': True
            }
            return render(request, 'search.html', ctx)

        ctx = {
            'form': SearchForm,
        }
        return render(request, 'search.html', ctx)

# EDITION


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


# DOCUMENT


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
            # content = form.cleaned_data['content']
            form.save()
            # return HttpResponse('Dodano gościa {}'.format(name))
            return HttpResponseRedirect(reverse('documents'))
        ctx = {
            'form': form,
        }
        return render(request, "add_document.html", ctx)


class UpdateDocumentView(View):
    def get(self, request, pk):
        document = Document.objects.get(pk=pk)
        form = DocumentForm(instance=document)
        ctx = {
            'form': form,
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


class DocumentUpdateView(UpdateView):
    model = Document
    fields = '__all__'
    success_url = reverse_lazy('documents')


class DocumentView(ListView):
    model = Document


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
            #SZYBSZE z usunieciem nieptrzebnego pola
            # del form.cleaned_data['password_c'] albo
            # form.cleaned_data.pop('password_c')
            # user = User.objects.create_user(**form.cleaned_data)


            #ZROBIC USER ADDED DELETED MODIFICATED TEMPLATE!

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
                return redirect('editions')

            form.add_error(field=None, error='Zły login lub hasło')

        ctx = {
            'form': form,
        }
        return render(request, 'login_form.html', ctx)


class UserLogoutView(View):
    def get(self, request):
        logout(request)
        return HttpResponse('Wylogowano')