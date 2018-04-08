from django.contrib.auth.models import Group, Permission, User
from django.core.exceptions import ValidationError


def validate_username(value):
    # if User.objects.filter(username=value):
    #     raise ValidationError("Jest już taki użytkwonik")
    try:
        User.objects.get(username=value)
        raise ValidationError("Jest już taki użytkownik")
    except User.DoesNotExist:
        pass


def validate_gosc(value):
    if not value:
        raise ValidationError("Pole nie może być puste")

