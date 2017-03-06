---
layout: page
title: 
permalink: /research/bibliography.html
---

# Bibliography

All my publications can also be found on the
[HAL open archive](https://cv.archives-ouvertes.fr/nicolas-p-rougier).  
**IdHAL**: [nicolas-p-rougier](https://cv.archives-ouvertes.fr/nicolas-p-rougier)
 — 
**ORCID**: [0000-0002-6972-589X](http://orcid.org/0000-0002-6972-589X)  

## Preprints
{% bibliography --query @article[keywords=preprint] %}

## Journal article
{% bibliography --query @article[keywords!=popular && keywords!=preprint] %}

## Book/Thesis
{% bibliography --query @phdthesis @book %}

## Book chapter
{% bibliography --query @incollection %}

## Conference
{% bibliography --query @inproceedings %}

## Tutorial
{% bibliography --query @misc[keywords=tutorial] %}

## Science outreach
{% bibliography --query @*[keywords=popular] %}

## Invited talks & lectures
{% bibliography --query @*[keywords=invited] %}
