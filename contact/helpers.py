from django.core.mail import EmailMultiAlternatives
from django.template import loader
from django.conf import settings

def send_email(subject, info, email_template, text_template):
    text_body = loader.render_to_string(text_template, info)
    html_body = loader.render_to_string(email_template, info)
    sender = settings.DEFAULT_FROM_EMAIL
    receiver = settings.DEFAULT_TO_EMAIL
    email_message = EmailMultiAlternatives(subject, text_body, sender, [receiver])
    email_message.attach_alternative(html_body, "text/html")

    email_message.send()
