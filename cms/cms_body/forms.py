from django import forms
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.core.exceptions import ValidationError
from django.forms import ModelMultipleChoiceField, SelectDateWidget
from django_select2.forms import Select2MultipleWidget
from tinymce.widgets import TinyMCE

from cms_body.models import Author, Document, Guest
from cms_body.validators import validate_gosc, validate_username


class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = '__all__'


class GuestSearchForm(forms.Form):
    gosc = forms.CharField(max_length=100, required=True)
    # guests = ModelMultipleChoiceField(queryset=Guest.objects.all(), widget=Select2MultipleWidget)

    # JESLI NIE REQUIRED
    # def clean_gosc(self):
    #     gosc = self.cleaned_data['gosc']
    #     if not gosc:
    #         raise ValidationError('POLE "GOŚĆ" JEST WYMAGANE')
    #     return gosc


class DocumentSearchForm(forms.Form):
    slowo = forms.CharField(max_length=100, required=True)
    data = forms.DateField(widget=SelectDateWidget)




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
    username = forms.CharField(max_length=128, label="User ")
    password = forms.CharField(widget=forms.PasswordInput, label="Hasło")


class AddUserForm(forms.Form):
    username = forms.CharField(max_length=128, validators=[validate_username])
    password = forms.CharField(widget=forms.PasswordInput)
    password_c = forms.CharField(widget=forms.PasswordInput)
    first_name = forms.CharField(max_length=128)
    last_name = forms.CharField(max_length=128)
    email = forms.EmailField()
    #sprawdzanie bledow w formularzach

    def clean_password_c(self):
        password = self.cleaned_data['password']
        password2 = self.cleaned_data['password_c']
        if password != password2:
            raise ValidationError('Hasła się różnią')
        return password


    # def clean_password_c(self):
    #     cleaned_data = super().clean()
    #     password = cleaned_data['password']
    #     password2 = cleaned_data['password_c']
    #     if password != password2:
    #         raise ValidationError('Hasła się różnią')
    #     return cleaned_data
