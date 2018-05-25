from django import forms
from django.core.exceptions import ValidationError
from django.forms import ModelMultipleChoiceField, SelectDateWidget
from django_select2.forms import Select2MultipleWidget, HeavySelect2Widget  # HeavySelect2MultipleWidget
from cms_body.models import Document, Guest, Edition
from cms_body.validators import validate_username
import datetime


class GuestSearchForm(forms.Form):
    gosc = forms.CharField(max_length=100, required=True, label="Gość")


year = datetime.date.today().year
date_today = datetime.date.today()
date_month_plus = date_today + datetime.timedelta(days=30)
date_month_minus = date_today - datetime.timedelta(days=30)

MONTHS = {
    1: ('styczeń'), 2: ('luty'), 3: ('marzec'), 4: ('kwiecień'),
    5: ('maj'), 6: ('czerwiec'), 7: ('lipiec'), 8: ('sierpień'),
    9: ('wrzesień'), 10: ('październik'), 11: ('listopad'), 12: ('grudzień')
}


class EditionSearchForm(forms.Form):

    data = forms.DateField(widget=SelectDateWidget(years=range(2017, year + 1), months=MONTHS,  empty_label=("Rok", "Miesiąc", "Dzień")))


class DocumentSearchForm(forms.Form):
    slowo = forms.CharField(max_length=100, required=False, label="Słowo")
    data = forms.DateField(widget=SelectDateWidget(years=range(2017, year + 1), months=MONTHS,  empty_label=("Rok", "Miesiąc", "Dzień")), label="Data")


class DocumentForm(forms.ModelForm):
    guests = ModelMultipleChoiceField(queryset=Guest.objects.all(), widget=Select2MultipleWidget(), label="Goście")
    edition = forms.ModelChoiceField(Edition.objects.filter(date__range=[date_month_minus, date_month_plus]))
    class Meta:
        model = Document
        fields = ['edition', 'published', 'guests', 'notes', 'topic', 'lead', 'content']
        widgets = {
            'lead': forms.Textarea(attrs={'rows': 10, 'cols': 85}),
            'notes': forms.Textarea(attrs={'rows': 10, 'cols': 85}),
            'topic': forms.Textarea(attrs={'rows': 1, 'cols': 85})
        }


class LoginForm(forms.Form):
    username = forms.CharField(max_length=128, label="User ")
    password = forms.CharField(widget=forms.PasswordInput, label="Hasło")


class AddUserForm(forms.Form):
    username = forms.CharField(max_length=128, validators=[validate_username], label="Użytkownik")
    password = forms.CharField(widget=forms.PasswordInput, label="Hasło")
    password_c = forms.CharField(widget=forms.PasswordInput, label="Powt. hasło")
    first_name = forms.CharField(max_length=128, label="Imię")
    last_name = forms.CharField(max_length=128, label="Nazwisko")
    email = forms.EmailField(label="e-mail")
    phone = forms.CharField(max_length=128, label="Telefon")

    def clean_password_c(self):
        password = self.cleaned_data['password']
        password2 = self.cleaned_data['password_c']
        if password != password2:
            raise ValidationError('Hasła się różnią')
        return password

