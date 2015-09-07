from django.shortcuts import render
from django.conf import settings

from .forms import ContactForm
from .helpers import send_email

def index(request):
    context = {}
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            info = {
                  'full_name': form.cleaned_data['full_name'],
                  'email': form.cleaned_data['email'],
                  'phone_number': form.cleaned_data['phone_number'],
                  'country': form.cleaned_data['country'],
                  'subject': form.cleaned_data['subject'],
                  'message': form.cleaned_data['message'],
                }
            send_email(settings.CONTACT_SUBJECT, info, 'contact/contact_info_email.html')
            context.update({'feedback': 'Thank you for contacting Nectar Beauty Hub. We will respond to your enquiry shortly.'})
    else:
        form = ContactForm()

    context.update({'form': form})
    return render(request, 'contact/index.html', context)
