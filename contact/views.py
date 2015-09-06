from django.shortcuts import render

from .forms import ContactForm

def index(request):
    context = {}
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            context.update({'feedback': 'Thank you for contacting Nectar Beauty Hub. We will respond to your enquiry shortly.'})
    else:
        form = ContactForm()

    context.update({'form': form})
    return render(request, 'contact/index.html', context)
