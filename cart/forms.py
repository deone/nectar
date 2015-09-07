from django import forms

DELIVERY_CHOICES = (
    ('Pickup', 'Pickup'),
    ('Nectar Delivery', 'Nectar Delivery'),
)

class RequestQuoteForm(forms.Form):
    business_name = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Name of Business'}))
    account_number = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Nectar Beauty Hub Account Number'}))
    contact_name = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Contact Name'}))
    contact_number = forms.CharField(widget=forms.NumberInput(attrs={'placeholder': 'Contact Number'}))
    contact_email = forms.EmailField(max_length=50, widget=forms.EmailInput(attrs={'placeholder': 'Contact Email'}))
    delivery_method = forms.ChoiceField(choices=DELIVERY_CHOICES, widget=forms.RadioSelect())
