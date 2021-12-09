from django.urls import path
from . import views

app_name = 'foodblog'
urlpatterns = [
    path('', views.index, name='index'),  # default for page number empty
    path('<int:page>', views.index, name='index'),
    path('post/<slug:slug>/', views.detail, name='detail'),
    path('thanks/<str:forwhat>', views.thanks, name='thanks'),
    path('tagcloud/', views.tagcloud, name='tagcloud'),
    path('tag/<str:tag>/<int:page>', views.tag, name='tag'),
    path('unsubscribe/', views.unsubscribe, name='unsubscribe'),
    path('contact/', views.contact, name='contact'),
]
