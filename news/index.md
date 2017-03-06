---
layout: page
order: 05
title: NEWS
permalink: /news/index.html
---

# News

This is the place where I record news related to my scientific life. It is
incredibly egocentric but it is part of the game I guess.

<ul class="post-list">
  {% for post in site.posts limit:5 %}
     {%if post.category == "news" %}
       <li>
       <h2>
         <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
       </h2>
       <span class="post-meta">{{ post.date | date: "%d %B %Y"}}</span>
       • 
       <span class="post-meta">{{ post.author }}</span>
       <br/>
       {% for tag in post.tags %}
          <span class="post-tag">{{tag}}</span>
       {% endfor %}
       {{ post.excerpt }}
       </li>
       {% capture count %}{{ count | plus: '1' }}{% endcapture %}
       {% if count == '3' or count =='2' or count == '1' %}
       {% endif %}
     {% endif %}
  {% endfor %}
</ul>


# Archives

{% for post in site.posts  %}

  {% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
  {% capture next_year %}{{ post.previous.date | date: "%Y" }}{% endcapture %}
  {% if forloop.first %}
  <h2 id="{{ this_year }}-ref">{{this_year}}</h2>
  <ul>
  {% endif %}
  {%if post.category == "news" %}
  <li><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
  • 
  <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span><br/>
  </li>
  {% endif %}
  {% if forloop.last %}
  </ul>
  {% else %}
  {% if this_year != next_year %}
  </ul>
  <h2 id="{{ next_year }}-ref">{{next_year}}</h2>
  <ul>
  {% endif %}
  {% endif %}
{% endfor %}
