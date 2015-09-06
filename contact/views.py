from django.shortcuts import render

from .forms import ContactForm

def index(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            pass
    else:
        form = ContactForm()

    context = {'form': form}
    return render(request, 'contact/index.html', context)
