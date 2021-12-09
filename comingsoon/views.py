from django.shortcuts import render
from datetime import date


# Create your views here.
def index(req):
    start_date = date(2022, 1, 1)
    context = {
        'days': (start_date - date.today()).days,
    }
    # end of view method must return a HttpResponse returned by render()
    return render(req, 'comingsoon/index.html', context)
