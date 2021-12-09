from django import forms
from django.utils.translation import gettext_lazy


class SubscribeForm(forms.Form):
    subscribe_email = forms.EmailField(
            widget=forms.TextInput(
                attrs={
                    "class": "w3-input w3-center",
                    "type": "email",
                    "placeholder": gettext_lazy("Please type your email here")
                    }),
            help_text=gettext_lazy("Type and submit your email here")
            )


class UnsubscribeForm(forms.Form):
    unsubscribe_email = forms.EmailField(
            widget=forms.TextInput(
                attrs={
                    "class": "w3-input w3-center",
                    "type": "email",
                    "placeholder": gettext_lazy("Please type your email here")
                    }),
            help_text=gettext_lazy("Type and submit your email here")
            )


class ContactForm(forms.Form):
    contact_email = forms.EmailField(
            widget=forms.TextInput(
                attrs={
                    "class": "w3-input",
                    "type": "email",
                    "placeholder": gettext_lazy("Please type your email here")
                    }),
            help_text=gettext_lazy("Type and submit your email here")
            )
    contact_message = forms.CharField(
        widget=forms.Textarea(
                attrs={
                    'class': 'w3-input',
                    'rows': '5',
                    })
            )
