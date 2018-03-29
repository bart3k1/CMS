from django import forms
from cms_body.models import Author


class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = '__all__'

