from django.contrib.auth.models import User
from django.db import models
from tinymce import models as tinymce_models

# Create your models here.

OCENA = (
    (0, '0'),
    (1, '1'),
    (2, '2'),
    (3, '3'),
    (4, '4'),
    (5, '5'),
    (6, '6'),
)


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, null=False, verbose_name='Telefon')


class Author(models.Model):
    name = models.CharField(max_length=40, null=False, verbose_name='Imię')
    surname = models.CharField(max_length=40, null=False, verbose_name='Nazwisko')
    phone = models.CharField(max_length=15, null=False, verbose_name='Telefon')

    class Meta:
        verbose_name = "Wydawca"
        verbose_name_plural = "Wydawcy"

    def __str__(self):
        return "{} {}".format(self.name, self.surname)


class Host(models.Model):
    name = models.CharField(max_length=40, null=False, verbose_name='Imię')
    surname = models.CharField(max_length=40, null=False, verbose_name='Nazwisko')
    phone = models.CharField(max_length=15, null=False, verbose_name='Telefon')

    def __str__(self):
        return "{} {}".format(self.name, self.surname)

    class Meta:
        verbose_name = "Prowadzący"
        verbose_name_plural = "Prowadzący"


class Guest(models.Model):
    name = models.CharField(max_length=40, verbose_name='Imię')
    surname = models.CharField(max_length=40, null=False, verbose_name='Nazwisko')
    phone = models.CharField(max_length=15, null=False, verbose_name='Telefon')
    alt_phone = models.CharField(max_length=128, null=True, blank=True, verbose_name='Telefon/Menadżer')
    notes = models.TextField(max_length=400, null=True, blank=True, verbose_name='Notatki')
    ocena = models.IntegerField(choices=OCENA, blank=True, null=True)

    def __str__(self):
        return "{} {}".format(self.name, self.surname)

    class Meta:
        verbose_name = "Gość"
        verbose_name_plural = "Goście"


class Edition(models.Model):
    date = models.DateField(auto_now_add=False, unique=True, verbose_name='Data')
    hosts = models.ManyToManyField(Host, related_name='editions', verbose_name='Prowadzący')
    editor = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Wydawca')

    def __str__(self):
        return "Wydanie {}".format(self.date)

    class Meta:
        verbose_name = "Wydanie"
        verbose_name_plural = "Wydania"


class Document(models.Model):
    edition = models.ForeignKey(Edition, on_delete=models.CASCADE, null=True, related_name='documents', verbose_name='Wydanie')
    author = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='documents', verbose_name='Autor')
    published = models.BooleanField(default=False, verbose_name='Opublikować?')
    guests = models.ManyToManyField(Guest, blank=True, related_name='documents', verbose_name='Goście')
    notes = models.TextField(max_length=200, null=True, verbose_name='Info')
    topic = models.CharField(max_length=100, verbose_name='Tytuł')
    lead = models.TextField(max_length=400, null=True, verbose_name='Lead')
    content = tinymce_models.HTMLField(verbose_name='Treść', null=True)

    def __str__(self):
            return "{}".format(self.topic)

    class Meta:
        verbose_name = "Dokument"
        verbose_name_plural = "Dokumenty"
