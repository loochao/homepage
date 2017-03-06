---
layout: page
order: 06
title: BLOG
permalink: /blog/index.html
---

# Blog

I've more questions than answers, this is why I've become a researcher.


<ul class="post-list">
   {% for post in site.posts %}
     {%if post.category == "blog" %}
     <li>
       <h2>
         <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
       </h2>
       <span class="post-meta">{{ post.date  | date: "%d %B %Y" }}</span>
       • 
       <span class="post-meta">{{ post.author }}</span>
       <br/>
       {% for tag in post.tags %}
          <span class="post-tag">{{tag}}</span>
       {% endfor %}
       {{ post.excerpt }}
    </li>
  {% endif %}
  {% endfor %}
</ul>


# Archives

<ul class="post-list">
  {% for post in site.posts %}
     {%if post.category == "blog" %}
     <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
     • 
     <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span><br/>
     {% endif %}
  {% endfor %}
</ul>
