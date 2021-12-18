"""djfoodblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
# import for Serving files uploaded by a user during development
from django.conf import settings
from django.conf.urls.static import static, serve
# import for i18n translation
from django.conf.urls.i18n import i18n_patterns
import mimetypes


urlpatterns = [
    # path('', include('comingsoon.urls')),
    path('', include('foodblog.urls')),
    path('admin/', admin.site.urls),
    # Add CKEditor URL include to your project’s urls:
    re_path(r'^ckeditor/', include('ckeditor_uploader.urls')),
]

# Serving files uploaded by a user during development
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
# for i18n translation
urlpatterns += i18n_patterns(
    # path('foodblog/', include('foodblog.urls')),
    # path('admin/', admin.site.urls),
)
# serving for Debug=false in development
if settings.DEBUG is False:
    urlpatterns += [
        re_path(r'^media/(?P<path>.*)$', serve,
                {'document_root': settings.MEDIA_ROOT}),
        re_path(r'^static/(?P<path>.*)$', serve,
                {'document_root': settings.STATIC_ROOT}),
    ]

# add minetype for Js to fix error: Disallowed Type
mimetypes.add_type("application/javascript", ".js", True)

# overide 404 page
handler404 = "foodblog.views.page404"

# admin titles
admin.site.site_header = "Administration of Staff"
# admin.site.site_url = None
