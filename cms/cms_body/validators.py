from django.contrib.auth.models import Group, Permission
from django.core.exceptions import ValidationError
from django.contrib.auth import get_user_model

User = get_user_model()


def validate_username(value):
    try:
        User.objects.get(username=value)
        raise ValidationError("Jest już taki użytkownik")
    except User.DoesNotExist:
        pass


def validate_gosc(value):
    if not value:
        raise ValidationError("Pole nie może być puste")
