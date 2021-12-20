from django.db import models
from django.utils.html import format_html
from ckeditor_uploader.fields import RichTextUploadingField
from django.urls import reverse
import os
from django.utils import timezone


# Create your models here.
class TextBlock(models.Model):
    name = models.CharField(max_length=100, default='option')
    title = models.CharField(max_length=100)
    content = RichTextUploadingField()
    image = models.ImageField(blank=True, null=True)

    def getImageTag(self):
        if self.image:
            return format_html('<img src="%s" alt="%s" width="150px" > ' % (self.image.url, self.title))
        else:
            return ''

    def __str__(self):
        return self.name


class Tag(models.Model):
    tag = models.CharField(max_length=50)
    slug = models.SlugField(default='no-slug')
    count = models.IntegerField(default=0)

    # method get_absolute_url() return url of object. It's often used for sitemap building
    def get_absolute_url(self):
        return reverse('foodblog:tag', kwargs={'slug': self.slug})

    # default returned value when object called
    def __str__(self):
        return self.tag


class Post(models.Model):
    #  Fields
    title = models.CharField(max_length=100)
    excerpt = models.CharField(max_length=200, blank=True, null=True)
    slug = models.SlugField()
    content = RichTextUploadingField()
    pub_date = models.DateTimeField()
    thumbnail = models.ImageField()
    # post has many tags and tags can belong to many posts
    tags = models.ManyToManyField(Tag, blank=True)
    # methods

    def __str__(self):
        return self.title

    def getImageTag(self):
        return format_html('<img src="%s" alt="%s" width="150px" > ' % (self.thumbnail.url, self.title))

    def get_absolute_url(self):
        return reverse('foodblog:detail', kwargs={'slug': self.slug})

    def save(self, *args, **kwargs):
        try:
            # keep old thumnail of post before save new one
            old_post = Post.objects.get(pk=self.id)

            super().save(*args, **kwargs)  # call parent's save for new update

            if str(old_post.thumbnail) != str(self.thumbnail):  # delete old thumbnail
                # print("remove it")
                try:
                    os.remove(old_post.thumbnail.path)
                except OSError as err:
                    print(err)
        except Post.DoesNotExist:
            super().save(*args, **kwargs)  # call parent's save for new update


class Subscriber(models.Model):
    sub_email = models.EmailField()

    def __str__(self):
        return self.sub_email


class Comment(models.Model):
    STATUS_CHOICES = [
        ("a", "approved"),
        ("u", "unapproved"),
        ("s", "spam"),
        ("t", "trash")
    ]
    name = models.CharField(max_length=100)
    email = models.EmailField()
    content = models.TextField()
    status = models.CharField(
        max_length=1, choices=STATUS_CHOICES, default="u")
    post = models.ForeignKey("Post", on_delete=models.CASCADE)
    pub_date = models.DateTimeField(default=timezone.now())

    def __str__(self):
        return self.name
