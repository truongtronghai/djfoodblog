from django.db import models
from django.utils.html import format_html
from ckeditor_uploader.fields import RichTextUploadingField


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
    count = models.IntegerField(default=0)


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


class Subscriber(models.Model):
    sub_email = models.EmailField()

    def __str__(self):
        return self.sub_email
