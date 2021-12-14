'''
This file contains all Signals used in this application.
Signals need to be stored in a seperate file name signals.py in application's folder.
This file ( as a module ) will be loaded to application by ready() method of apps.py file.
'''
from django.db.models.signals import m2m_changed, pre_delete
from .models import Tag, Post
import os


def updating_count_of_tag(sender, **kwargs):
    # print("post-tag relation event trigged !!!!!!!!!!")
    # print(kwargs)
    obj = kwargs['instance']  # I get the object being saved here
    tags = Tag.objects.filter(post__id=obj.id)  # __ is double scores
    # print(tags)
    # print("--------------------")

    for tag in tags:

        # update tag counting
        tag.count = Post.tags.through.objects.filter(tag_id=tag.id).count()
        # adjust count for situation of removing in m2m model
        if kwargs["action"] == "pre_remove":
            tag.count -= 1  # update before record has been removed

        tag.save()


def delete_thumbnail_of_post(sender, **kwargs):
    # print(kwargs['instance'].thumbnail.path)
    os.remove(kwargs['instance'].thumbnail.path)


# Post.tags.through is imtermidiate model for many-to-many relationship
m2m_changed.connect(updating_count_of_tag, sender=Post.tags.through)
pre_delete.connect(delete_thumbnail_of_post, sender=Post)
