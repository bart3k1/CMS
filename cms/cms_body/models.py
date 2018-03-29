from django.db import models

# Create your models here.


class Author(models.Model):
    name = models.CharField(max_length=40, null=False)
    surname = models.CharField(max_length=40, null=False)
    phone = models.CharField(max_length=15, null=False)

    def __str__(self):
        return "{} {}".format(self.name, self.surname)


class Host(models.Model):
    name = models.CharField(max_length=40, null=False)
    surname = models.CharField(max_length=40, null=False)
    phone = models.CharField(max_length=15, null=False)

    def __str__(self):
        return "{} {}".format(self.name, self.surname)


class Guest(models.Model):
    name = models.CharField(max_length=40)
    surname = models.CharField(max_length=40, null=False)
    phone = models.CharField(max_length=15, null=False)
    alt_phone = models.CharField(max_length=128, null=False)
    notes = models.CharField(max_length=200, null=True)

    def __str__(self):
        return "{} {}".format(self.name, self.surname)


class Edition(models.Model):
    date = models.DateField(auto_now_add=False)
    hosts = models.ManyToManyField(Host, related_name='programs_hosts')
    editor = models.ForeignKey(Author)

    def __str__(self):
        return "Wydanie {}".format(self.date)
