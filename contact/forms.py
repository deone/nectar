from django import forms

class ContactForm(forms.Form):
    full_name = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Full Name'}))
    email = forms.EmailField(max_length=50, widget=forms.EmailInput(attrs={'placeholder': 'Email'}))
    phone_number = forms.CharField(widget=forms.NumberInput(attrs={'placeholder': 'Phone Number'}))
    country = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Country'}))
    subject = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Subject'}))
    message = forms.CharField(widget=forms.Textarea)
