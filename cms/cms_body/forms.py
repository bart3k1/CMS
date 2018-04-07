from django import forms
from django.core.exceptions import ValidationError
from cms_body.models import Author, Document, Guest
from django.forms import ModelMultipleChoiceField
from tinymce.widgets import TinyMCE
from cms_body.validators import validate_username
from django.contrib.admin.widgets import FilteredSelectMultiple
from django_select2.forms import Select2MultipleWidget


class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = '__all__'


class SearchForm(forms.Form):
    gosc = forms.CharField(max_length=100, required=False)
    # guests = ModelMultipleChoiceField(queryset=Guest.objects.all(), widget=Select2MultipleWidget)


class DocumentForm(forms.ModelForm):
    # content = forms.CharField(widget=TinyMCE(attrs={'cols': 10, 'rows': 100}))
    # guests = FilteredSelectMultiple(verbose_name="Goście", is_stacked=True)
    guests = ModelMultipleChoiceField(queryset=Guest.objects.all(), widget=Select2MultipleWidget)

    class Meta:
        model = Document
        fields = '__all__'

        # widgets = {'guests': FilteredSelectMultiple(verbose_name="Goście", is_stacked=False)}

    # class Media:
    #     css = {'all':['admin/css/widgets.css']}
    #     js = ['/admin/jsi18n/']


class LoginForm(forms.Form):
    username = forms.CharField(max_length=128)
    password = forms.CharField(widget=forms.PasswordInput)


class AddUserForm(forms.Form):
    username = forms.CharField(max_length=128, validators=[validate_username])
    password = forms.CharField(widget=forms.PasswordInput)
    password_c = forms.CharField(widget=forms.PasswordInput)
    first_name = forms.CharField(max_length=128)
    last_name = forms.CharField(max_length=128)
    email = forms.EmailField()
    #sprawdzanie bledow w formularzach

    def clean_password_c(self):
        cleaned_data = super().clean()
        password = cleaned_data['password']
        password2 = cleaned_data['password_c']
        if password != password2:
            raise ValidationError('Hasła się różnią')
        return cleaned_data

