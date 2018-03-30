from django.core.exceptions import ValidationError
from django.contrib.auth.models import Group, Permission, User


def validate_username(value):
    # if User.objects.filter(username=value):
    #     raise ValidationError("Jest już taki użytkwonik")
    try:
        User.objects.get(username=value)
        raise ValidationError("Jest już taki użytkwonik")
    except User.DoesNotExist:
        pass
