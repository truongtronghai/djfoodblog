from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.core.mail import send_mail  # using for sending email
# using for Internationalization and Localization
from django.utils.translation import gettext
from .models import Tag, Post, TextBlock, Subscriber, Comment
from .forms import SubscribeForm, UnsubscribeForm, ContactForm, SearchForm, CommentForm
# Pagination
from django.core.paginator import Paginator


def getOptions():
    try:

        opts = TextBlock.objects.all()
        options = {}
        for i in opts:
            if i.name == 'logo':
                options["logo_text"] = i.title
                options["logo"] = i.image
            if i.name == 'footer':
                options["footer_text"] = i.content
            if i.name == 'feature':
                options["feature_block"] = i

    except TextBlock.DoesNotExist:
        options = {}

    return options


def getTags(numbers=0):
    try:
        if numbers > 0:
            tags = Tag.objects.order_by('-count')[:numbers]
        else:
            tags = Tag.objects.all()
    except Tag.DoesNotExist:
        tags = []
    return tags


# Function gets comments of post with specific page
# And return page object and Paginator of those comments
def getComments(post_id, page):
    items_per_page = 10
    try:
        comments = Comment.objects.filter(post=post_id).order_by('-pub_date')
        paginator = Paginator(comments, items_per_page)
        if page < 1 or page > paginator.num_pages:
            page = 1
        current_page = paginator.page(page)  # get page object of current page

        i = (page - 1) * items_per_page
        paginated_comments = comments[i:(i+items_per_page)]

    except Comment.DoesNotExist:
        return {}

    return {
        "paginated_comments": paginated_comments,
        "comment_paginator": paginator,
        "comment_current_page": current_page
    }
# Create your views here.


def index(req, page=1):  # default number for page is 1

    items_per_page = 8

    try:
        posts = Post.objects.order_by('-pub_date')
        paginator = Paginator(posts, items_per_page)

        if page < 1 or page > paginator.num_pages:
            page = 1  # set default page for invalid page value from user

        # get an instance of Page() of current page
        current_page = paginator.page(page)

        '''
        Get paginated posts:

        caculating position of posts in current page
        page=1 : i = (1-1) * 8 = 0 => j = 0 + 8 = 8
        page=2 : i = ( 2-1 ) * 8 = 8 => j = 8 + 8 = 16
        page=3 : i = ( 3-1 ) * 8 = 16 => j = 16 + 8 = 24
        page=n : i = (n -1) * n_per_page => j = i + n_per_page

        '''
        i = (page - 1) * items_per_page
        paginated_posts = posts[i:(i+items_per_page)]

    except Post.DoesNotExist:
        paginated_posts = None
        current_page = None
        paginator = None

    # Subscribe form
    # Normally, browser will GET a http request. So, I just care about form data when form is submited
    if req.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = SubscribeForm(req.POST)

        if form.is_valid():
            # process the data in form.cleaned_data as required
            # print(form.cleaned_data)
            if Subscriber.objects.create(sub_email=form.cleaned_data["subscribe_email"]):
                # redirect to a another URL:
                return HttpResponseRedirect('thanks/subscribe')
            else:
                pass  # not find out scenario for fail case
        else:
            # if form data is not valid, old data will still be stored in form and redirect to previous view
            pass
    else:
        form = SubscribeForm()  # empty form

    context = {
        "popular_tags": getTags(10),
        "options": getOptions(),
        "posts": {
            "paginated_posts": paginated_posts,
            "paginator": paginator,
            "current_page": current_page
        },
        "subscribe_form": form,
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
    }

    return render(req, 'foodblog/index.html', context)


def detail(req, slug='', p=1):  # p is page of comments
    try:
        post_detail = Post.objects.get(slug=slug)
    except Post.DoesNotExist:
        from django.http import Http404
        raise Http404

    if req.method == 'POST':
        # form with bound data from request
        comment_form = CommentForm(req.POST)
        if comment_form.is_valid():
            if Comment.objects.create(
                    name=comment_form.cleaned_data["name"],
                    email=comment_form.cleaned_data["email"],
                    content=comment_form.cleaned_data["content"],
                    status="u",  # comment is always set to unapproved value
                    post=post_detail.id  # get id of current post
                    ):
                # redirect to a another URL:
                return HttpResponseRedirect("detail/%s/%s" % (slug, p))
            else:
                pass  # not find out scenario for fail case

    context = {
        "options": getOptions(),
        "popular_tags": getTags(10),
        "post": post_detail,
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
        "comment_form": CommentForm(),
        "comments": getComments(post_detail.id, p)
    }
    return render(req, 'foodblog/detail.html', context)


def thanks(req, forwhat='subscibe'):
    messages = {
        'subscribe': {
            'title': gettext('Welcome my new Subscriber'),
            'message': gettext('Thanks for subscribing our blog.<br>You will receive our latest post ASAP!')
            },
        'unsubscribe': {
            'title': gettext('Thank you!'),
            'message': gettext('Hope you will be back.')
        },
        'notsubscribed': {
            'title': gettext('Thank you!'),
            'message': gettext('Thank you but you have not subscribed my blog.')
        },
    }

    context = {
        "options": getOptions(),
        "popular_tags": getTags(10),
        "title": messages[forwhat]['title'],
        "message": messages[forwhat]['message'],
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
    }
    return render(req, 'foodblog/thanks.html', context)


def tagcloud(req):
    context = {
        "options": getOptions(),
        "popular_tags": getTags(10),
        "tags": getTags(),  # get all tags,
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
    }
    return render(req, 'foodblog/tagcloud.html', context)


def tag(req, slug='', page=1):
    items_per_page = 8

    # tag is slugified in URL, so I need to get to normal string for query string
    tag = Tag.objects.get(slug=slug)

    try:
        # get manytomany objects

        posts = Post.objects.filter(tags__tag=tag)
        paginator = Paginator(posts, items_per_page)

        if page < 1 or page > paginator.num_pages:
            page = 1  # set default page for invalid page value from user

        # get an instance of Page() of current page
        current_page = paginator.page(page)

        '''
        Get paginated posts:

        caculating position of posts in current page
        page=1 : i = (1-1) * 8 = 0 => j = 0 + 8 = 8
        page=2 : i = ( 2-1 ) * 8 = 8 => j = 8 + 8 = 16
        page=3 : i = ( 3-1 ) * 8 = 16 => j = 16 + 8 = 24
        page=n : i = (n -1) * n_per_page => j = i + n_per_page

        '''
        i = (page - 1) * items_per_page
        paginated_posts = posts[i:(i+items_per_page)]

    except Post.DoesNotExist:
        paginated_posts = None
        current_page = None
        paginator = None

    context = {
        "popular_tags": getTags(10),
        "options": getOptions(),
        "tag": tag,
        "posts": {
            "paginated_posts": paginated_posts,
            "paginator": paginator,
            "current_page": current_page
        },
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
    }

    return render(req, 'foodblog/tag.html', context)


def unsubscribe(req):
    if req.method == 'POST':
        form = UnsubscribeForm(req.POST)
        if form.is_valid():
            try:
                sub = Subscriber.objects.get(
                    sub_email=form.cleaned_data["unsubscribe_email"])
                sub.delete()
                # must use namespace for app name: <foodblog:thanks> not <thanks>
                return HttpResponseRedirect(reverse('foodblog:thanks', args=['unsubscribe']))

            except Subscriber.DoesNotExist:
                return HttpResponseRedirect(reverse('foodblog:thanks', args=['notsubscribed']))

    else:
        form = UnsubscribeForm()  # creating an empty form for template

    context = {
        "popular_tags": getTags(10),
        "options": getOptions(),
        "unsubscribe_form": form,
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
    }
    return render(req, 'foodblog/unsubscribe.html', context)


def contact(req):
    if req.method == "POST":
        # create form and bind data form POST for it
        form = ContactForm(req.POST)
        if form.is_valid():
            # get email address from option ( TextBlock )
            results = send_mail(
                "Contact from {}".format(form.cleaned_data["contact_email"]),
                form.cleaned_data["contact_message"],
                TextBlock.objects.get(name='email'),
                # sending mail to myself
                [TextBlock.objects.get(name='email').content],
                fail_silently=False,
                # html_message="<h1>Nothing</h1>",
            )
            if results > 0:
                pass
            else:
                pass
    else:
        pass

    return HttpResponseRedirect(reverse("foodblog:index"))


def page404(req, exception):
    return render(req, 'foodblog/404.html', {})


def search(req, q='', p=1):
    items_per_page = 10

    if req.method == "POST":
        s_form = SearchForm(req.POST)  # create data-bound form object
        if s_form.is_valid():
            q = s_form.cleaned_data['search_text']

    if q is None:
        paginated_posts = None
        current_page = None
        paginator = None
    else:
        try:
            # __icontains is field lookup
            # but it's just case-insensitve with DB having collation which ends with _ci
            # | is or operator
            posts = Post.objects.filter(
                title__icontains=q) | Post.objects.filter(content__icontains=q)
            paginator = Paginator(posts, items_per_page)

            if p < 1 or p > paginator.num_pages:
                p = 1  # set default page for invalid page value from user

            # get an instance of Page() of current page
            current_page = paginator.page(p)

            '''
            Get paginated posts:
            Example: items_per_page=8
            Caculating position of posts in current page from i to j
            page=1 : i = (1-1) * 8 = 0 => j = 0 + 8 = 8
            page=2 : i = (2-1) * 8 = 8 => j = 8 + 8 = 16
            page=3 : i = (3-1) * 8 = 16 => j = 16 + 8 = 24
            page=n : i = (n-1) * n_per_page => j = i + n_per_page

            '''
            i = (p - 1) * items_per_page
            paginated_posts = posts[i:(i+items_per_page)]

        except Post.DoesNotExist:
            paginated_posts = None
            current_page = None
            paginator = None

    context = {
        "popular_tags": getTags(10),
        "options": getOptions(),
        "query": q,
        "posts": {
            "paginated_posts": paginated_posts,
            "paginator": paginator,
            "current_page": current_page
        },
        "contact_form": ContactForm(),
        "search_form": SearchForm(),
    }

    return render(req, 'foodblog/search.html', context)
