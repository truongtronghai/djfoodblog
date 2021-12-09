'''
This file contains all Signals used in this application.
Signals need to be stored in a seperate file name signals.py in application's folder.
This file ( as a module ) will be loaded to application by ready() method of apps.py file.
'''
from django.db.models.signals import m2m_changed
from .models import Tag, Post


def increasing_count_of_tag(sender, **kwargs):
    # print("post saving event trigged !!!!!!!!!!")
    obj = kwargs['instance']  # I get the object being saved here
    tags = Tag.objects.filter(post__id=obj.id)  # __ is double scores
    print(tags)

    for tag in tags:

        # update tag counting
        tag.count = Post.tags.through.objects.filter(tag_id=tag.id).count()
        tag.save()


# Post.tags.through is imtermidiate model for many-to-many relationship
m2m_changed.connect(increasing_count_of_tag, sender=Post.tags.through)
