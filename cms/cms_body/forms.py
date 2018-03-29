from django import forms

from cms_body.models import Author, Document, Guest
from tinymce.widgets import TinyMCE


class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = '__all__'


class DocumentForm(forms.ModelForm):
    content = forms.CharField(widget=TinyMCE(attrs={'cols': 10, 'rows': 100}))
    guests = forms.ModelMultipleChoiceField(queryset=Guest.objects.all(), widget=forms.CheckboxSelectMultiple)

    class Meta:
        model = Document
        fields = '__all__'