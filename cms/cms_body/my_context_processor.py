from datetime import datetime


def my_cp(request):
    ctx = {
        "now": datetime.now(),
        "version": "by: bartek",

    }
    return ctx
