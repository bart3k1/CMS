from django.db import models

# Create your models here.


class Author(models.Model):
    name = models.CharField(max_length=40, null=False, verbose_name='Imię')
    surname = models.CharField(max_length=40, null=False, verbose_name='Nazwisko')
    phone = models.CharField(max_length=15, null=False, verbose_name='Telefon')

    def __str__(self):
        return "{} {}".format(self.name, self.surname)

    class Meta:
        verbose_name = "Wydawca"
        verbose_name_plural = "Wydawcy"


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
    alt_phone = models.CharField(max_length=128, null=False, verbose_name='Telefon/Menadżer')
    notes = models.CharField(max_length=200, null=True, verbose_name='Notatki')

    def __str__(self):
        return "{} {}".format(self.name, self.surname)

    class Meta:
        verbose_name = "Gość"
        verbose_name_plural = "Goście"


class Edition(models.Model):
    date = models.DateField(auto_now_add=False, verbose_name='Data')
    hosts = models.ManyToManyField(Host, related_name='programs_hosts', verbose_name='Prowadzący')
    editor = models.ForeignKey(Author, verbose_name='Wydawca')

    def __str__(self):
        return "Wydanie {}".format(self.date)

    class Meta:
        verbose_name = "Wydanie"
        verbose_name_plural = "Wydania"