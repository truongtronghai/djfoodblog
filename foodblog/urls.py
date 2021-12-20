from django.urls import path
from . import views
# import for sitemaps
from django.contrib.sitemaps.views import sitemap  # view for sitemap
from .sitemaps import PostSitemap, TagcloudSitemap, StaticPageSitemap  # items for sitemap

app_name = 'foodblog'

sitemaps = {
    "post": PostSitemap,
    "tagcloud": TagcloudSitemap,
    "page": StaticPageSitemap,
}

urlpatterns = [
    path('', views.index, name='index'),  # default for page number empty
    path('<int:page>', views.index, name='index'),

    path('post/<slug:slug>/', views.detail, name='detail'),
    path('post/<slug:slug>/<int:p>', views.detail, name='detail'),

    path('thanks/<str:forwhat>', views.thanks, name='thanks'),
    path('tagcloud/', views.tagcloud, name='tagcloud'),
    # default for page number empty
    path('tag/<str:tag>/', views.tag, name='tag'),
    path('tag/<str:tag>/<int:page>', views.tag, name='tag'),
    path('unsubscribe/', views.unsubscribe, name='unsubscribe'),
    path('contact/', views.contact, name='contact'),
    # default for query or page number empty
    path('search/', views.search, name='search'),
    path('search/<str:q>/', views.search, name='search'),
    path('search/<str:q>/<int:p>', views.search, name='search'),
    # creating sitemap.xml
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps},
         name='django.contrib.sitemaps.views.sitemap'),
]
