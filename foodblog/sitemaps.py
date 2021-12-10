from django.contrib.sitemaps import Sitemap
from .models import Post, Tag


class PostSitemap(Sitemap):
    changefreq = "always"
    priority = "0.5"

    def items(self):
        return Post.objects.all()

    def lastmod(self, obj):
        return obj.pub_date


class TagcloudSitemap(Sitemap):
    changefreq = "always"
    priority = "0.5"

    def items(self):
        return Tag.objects.all()
