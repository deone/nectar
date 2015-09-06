from django.core.mail import EmailMultiAlternatives
from django.template import loader

def send_contact_request_mail(subject, info, sender, receiver):
    email_template = 'contact/contact_info_email.html'
    body = loader.render_to_string(email_template, info)
    email_message = EmailMultiAlternatives(subject, body, sender, [receiver])    

    email_message.send()
