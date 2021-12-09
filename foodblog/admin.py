from django.contrib import admin
from .models import Post, TextBlock, Tag, Subscriber


class TextBlockAdmin(admin.ModelAdmin):
    list_display = ("name", "title", "getImageTag")


class TagAdmin(admin.ModelAdmin):
    list_display = ("tag", "count")


class PostAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ["title"]}  # used for SlugField
    list_display = (
        "title",
        "slug",
        "excerpt",
        "pub_date",
        "getImageTag",
    )


# Register your models here.
admin.site.register(Post, PostAdmin)
admin.site.register(TextBlock, TextBlockAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Subscriber)
