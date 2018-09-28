from django import forms
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import get_user_model
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.urls import reverse, reverse_lazy
from django.views import View
from django.views.generic import (CreateView, DeleteView, DetailView, ListView,
                                  UpdateView)
from cms_body.forms import (AddUserForm, DocumentForm, DocumentSearchForm,
                            EditionSearchForm, GuestSearchForm, LoginForm)
from cms_body.models import Document, Edition, Guest, Host


User = get_user_model()

# INDEX


class IndexView(View):
    def get(self, request):
        ctx = {
            'editions': Edition.objects.all().order_by('-id')[0:10],
            'authors': User.objects.all().order_by('-id')[0:10],
            'documents': Document.objects.all().order_by('-id')[0:10],
            'guests': Guest.objects.all().order_by('-id')[0:10],
            'hosts': Host.objects.all().order_by('-id')[0:10],

        }
        if request.user.is_authenticated:
            return render(request, "index.html", ctx)
        else:
            return redirect('user-login')


# HOST


class HostDetailView(DetailView):
    model = Host


class HostListView(ListView):
    model = Host
    # template_name = 'cms_body/authors.html' # now - author_list.html


class HostCreateView(PermissionRequiredMixin, CreateView):
    permission_required = 'cms_body.add_document'
    model = Host
    fields = '__all__'
    success_url = reverse_lazy('hosts')


# GUEST


class GuestCreateView(PermissionRequiredMixin, CreateView):
    permission_required = 'cms_body.add_document'
    model = Guest
    fields = '__all__'
    success_url = reverse_lazy('guests')


class GuestListView(View):
    def get(self, request):
        ctx = {
            'guests': Guest.objects.all().order_by('-id')[0:10],
            'form': GuestSearchForm,
        }
        return render(request, 'guest_list.html', ctx)

    def post(self, request):
        form = GuestSearchForm(request.POST)
        if form.is_valid():
            guest_name = form.cleaned_data['name']
            guest_lastname = form.cleaned_data['lastname']
            all_guests_list = Guest.objects.all()
            for guest_name in guest_name.split():
                # guests_list1 = all_guests_list.filter(Q(name__icontains=guest_name) | Q(surname__icontains=guest_name)) # | Q(notes__icontains=guest_name))
                guests_list1 = all_guests_list.filter(name__icontains=guest_name)
            if guest_lastname:
                for guest_lastname in guest_lastname.split():
                    guests_list2 = all_guests_list.filter(surname__icontains=guest_lastname) # | Q(notes__icontains=guest_name))
                    guests_list = [obj for obj in guests_list1 if obj in guests_list2]
            else:
                guests_list = guests_list1
            #todo PAGINATION
            # print(guests_list)
            #
            # paginator = Paginator(guests_list, 10)
            # page = request.GET.get('page')
            # pag_list = paginator.get_page(page)

            ctx = {
                'guests': Guest.objects.all().order_by('-id')[0:10],
                'form': form,
                'guests_list': guests_list
                # 'pag_list': pag_list,
                # 'page': page,
                # 'paginator': paginator

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


MONTHS = {
    1: ('styczeń'), 2: ('luty'), 3: ('marzec'), 4: ('kwiecień'),
    5: ('maj'), 6: ('czerwiec'), 7: ('lipiec'), 8: ('sierpień'),
    9: ('wrzesień'), 10: ('październik'), 11: ('listopad'), 12: ('grudzień')
}


class EditionCreateView(PermissionRequiredMixin, CreateView):
    permission_required = 'cms_body.add_document'
    model = Edition
    fields = '__all__'
    success_url = reverse_lazy('editions')

    def get_form(self):
        # add date picker in forms
        from django.forms.widgets import SelectDateWidget
        import datetime
        year = datetime.date.today().year
        print(year)
        form = super(EditionCreateView, self).get_form()
        form.fields['date'].widget = SelectDateWidget(years=range(2017, year+1), months=MONTHS,  empty_label=("Rok", "Miesiąc", "Dzień"))
        return form


class EditionListView(View):
    def get(self, request):
        ctx = {
            'editions': Edition.objects.all().order_by('-id')[0:20],
            'form': EditionSearchForm,
            'button': "Szukaj",
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
                'button': "Szukaj",

            }
            return render(request, 'edition_list.html', ctx)

        ctx = {
            'editions': Edition.objects.all().order_by('-id')[0:20],
            'form': form,
            'button': "Szukaj",
        }
        return render(request, 'edition_list.html', ctx)


class EditionUpdateView(PermissionRequiredMixin, UpdateView):
    permission_required = 'cms_body.add_document'
    model = Edition
    fields = '__all__'
    success_url = reverse_lazy('editions')

    def get_form(self):
        '''add date picker in forms'''
        from django.forms.widgets import SelectDateWidget
        form = super(EditionUpdateView, self).get_form()
        form.fields['date'].widget = SelectDateWidget()
        return form


class EditionDeleteView(PermissionRequiredMixin, DeleteView):
    permission_required = 'cms_body.add_document'
    model = Edition
    success_url = reverse_lazy('editions')


class EditionDetailView(DetailView):
    model = Edition


# DOCUMENT


class AddDocument(PermissionRequiredMixin, View):
    permission_required = 'cms_body.add_document'

    def get(self, request):
        ctx = {
            'form': DocumentForm,
            'head': "Dodaj dokumentację",
        }
        return render(request, "add_document.html", ctx)

    def post(self, request):
        form = DocumentForm(request.POST)
        if form.is_valid():
            current_user = request.user
            document = Document.objects.create(
                edition=form.cleaned_data['edition'],
                published=form.cleaned_data['published'],
                notes=form.cleaned_data['notes'],
                topic=form.cleaned_data['topic'],
                lead=form.cleaned_data['lead'],
                content=form.cleaned_data['content'],
                author=current_user)
            document.guests.set(form.cleaned_data['guests'])
            document.save()
            return HttpResponseRedirect(reverse('documents'))
        ctx = {
            'form': form,
            'head': "Dodaj dokumentację",
        }
        return render(request, "add_document.html", ctx)


class UpdateDocumentView(PermissionRequiredMixin, View):
    permission_required = 'cms_body.add_document'

    def get(self, request, pk):
        document = Document.objects.get(pk=pk)
        guests = Guest.objects.all().filter(documents=pk)
        form = DocumentForm(instance=document)
        ctx = {
            'form': form,
            'guests': guests,
            'head': "Zmień dokumentację",
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
            'documents': Document.objects.all().filter(published=True).order_by('-id')[0:20],
            'form': DocumentSearchForm,
        }
        return render(request, 'document_list.html', ctx)

    def post(self, request):
        form = DocumentSearchForm(request.POST)
        if form.is_valid():
            slowo = form.cleaned_data['slowo']
            data = form.cleaned_data['data']
            if slowo:
                topic = Document.objects.filter(topic__icontains=slowo).order_by('-id').filter(published=True)
                lead = Document.objects.filter(lead__icontains=slowo).order_by('-id').filter(published=True)
                content = Document.objects.filter(content__icontains=slowo).order_by('-id').filter(published=True)

            else:
                topic = None
                lead = None
                content = None


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
                'documents': Document.objects.all().filter(published=True).order_by('-id')[0:20],
                'wyniki': None
            }
            return render(request, 'document_list.html', ctx)

        ctx = {

            'form': form,
        }
        return render(request, 'document_list.html', ctx)


class DocumentDetailView(DetailView):
    model = Document


class DocumentDetailPopView(DetailView):
    model = Document
    template_name = 'cms_body/document_detail_pop.html'


class DocumentDeleteView(PermissionRequiredMixin, DeleteView):
    permission_required = 'cms_body.add_document'
    model = Document
    success_url = reverse_lazy('documents')


# USER

class AddUserView(PermissionRequiredMixin, View):
    permission_required = 'cms_test.add_user'

    def get(self, request):
        ctx = {
            'form': AddUserForm,
            'head': "Dodaj użytkownika",
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
                                            email=form.cleaned_data['email'],
                                            phone=form.cleaned_data['phone'])
            # z usunieciem nieptrzebnego pola
            # del form.cleaned_data['password_c'] albo
            # form.cleaned_data.pop('password_c')
            # user = User.objects.create_user(**form.cleaned_data)
            # return HttpResponse('DODANO! usera o id {}'.format(user.id))
            return redirect('users')

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
        return redirect('user-login')


class UserView(ListView):
    model = User
    template_name = 'cms_body/user_list.html'  # 'cms_body/authors.html' #


class UserDetailView(DetailView):
    model = User
    template_name = 'cms_body/user_detail.html'


class MyView(View):
    def get(self, request):
        current_user = request.user
        ctx = {
            'not_published_documents': Document.objects.all().filter(author_id=current_user.id).filter(
                published=False).order_by('-id')[0:20],
            'documents': Document.objects.all().filter(author_id=current_user.id).filter(published=True).order_by(
                '-id')[0:20],
            'editions': Edition.objects.all().filter(editor_id=current_user.id).order_by(
                '-id')[0:20],
        }
        return render(request, 'my_list.html', ctx)
