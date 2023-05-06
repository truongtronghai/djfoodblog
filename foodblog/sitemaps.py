from django.contrib.sitemaps import Sitemap
from django.urls import reverse

from .models import Post, Tag


class PostSitemap(Sitemap):
    changefreq = "weekly"
    priority = "0.5"

    def items(self):
        return Post.objects.all()

    def lastmod(self, obj):
        return obj.pub_date


class TagcloudSitemap(Sitemap):
    changefreq = "weekly"
    priority = "0.5"

    def items(self):
        return Tag.objects.all()


class StaticPageSitemap(Sitemap):
    changefreq = "weekly"
    priority = "1.0"

    def items(self):
        return ["foodblog:index"]

    def location(self, item):
        return reverse(item)
