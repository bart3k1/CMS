from datetime import datetime


def my_cp(request):
    mail = '''<a href="mailto:XXX@xxx.xxx?subject=CMS">Zgłoś uwagę >>></a>'''
    ctx = {
        "now": datetime.now(),
        "version": ''' --- by: bartek --- ''',
        "mail": mail,

    }
    return ctx
