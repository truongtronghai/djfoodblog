from django.contrib import admin
from .models import Post, TextBlock, Tag, Subscriber, Comment


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
    save_on_top = True
    search_fields = ["title", "excerpt"]
    filter_horizontal = ["tags"]  # change layout for m2m in admin site


class CommentAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "email",
        "content",
        "status"
    )

    def approve(self, request, queryset):
        queryset.update(status="a")

    def spam(self, request, queryset):
        queryset.update(status="s")

    def trash(self, request, queryset):
        queryset.update(status="t")

    def unapprove(self, request, queryset):
        queryset.update(status="u")

    actions = [approve, unapprove, spam, trash]


# Register your models here.
admin.site.register(Post, PostAdmin)
admin.site.register(TextBlock, TextBlockAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Subscriber)
admin.site.register(Comment, CommentAdmin)
