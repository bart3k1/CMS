from django import forms
from django.core.exceptions import ValidationError
from django.forms import ModelMultipleChoiceField, SelectDateWidget
from django_select2.forms import Select2MultipleWidget
from cms_body.models import Author, Document, Guest
from cms_body.validators import validate_gosc, validate_username


class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = '__all__'


class GuestSearchForm(forms.Form):
    gosc = forms.CharField(max_length=100, required=True, label="Gość")


class EditionSearchForm(forms.Form):
    import datetime
    year = datetime.date.today().year
    data = forms.DateField(widget=SelectDateWidget(years=range(2017, year + 1)))


class DocumentSearchForm(forms.Form):
    slowo = forms.CharField(max_length=100, required=True, label="Wyszukaj słowo")
    data = forms.DateField(widget=SelectDateWidget, label="Data wydania")


class DocumentForm(forms.ModelForm):
    guests = ModelMultipleChoiceField(queryset=Guest.objects.all(), widget=Select2MultipleWidget, label="Goście")

    class Meta:
        model = Document
        fields = '__all__'


class LoginForm(forms.Form):
    username = forms.CharField(max_length=128, label="User ")
    password = forms.CharField(widget=forms.PasswordInput, label="Hasło")


class AddUserForm(forms.Form):
    username = forms.CharField(max_length=128, validators=[validate_username], label="Użytkownik")
    password = forms.CharField(widget=forms.PasswordInput, label="Hasło")
    password_c = forms.CharField(widget=forms.PasswordInput, label="Hasło x 2")
    first_name = forms.CharField(max_length=128, label="Imię")
    last_name = forms.CharField(max_length=128, label="Nazwisko")
    email = forms.EmailField(label="e-mail")

    def clean_password_c(self):
        password = self.cleaned_data['password']
        password2 = self.cleaned_data['password_c']
        if password != password2:
            raise ValidationError('Hasła się różnią')
        return password
