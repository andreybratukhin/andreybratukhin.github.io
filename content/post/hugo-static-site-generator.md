---
title: 'Hugo: a static site generator'
date: '2017-01-03'
tags: ['web']
category: 'Web'
---

A static site definitely has own advantages. There are almost no maintenance costs.
And more importantly in long term it preserves accessibility of the information.


Yet another plausible aspect of hosting of a static site, it's more environment friendly.
It doesn't require to run full featured dynamic web site (I look to you - Wordpress) just 
to serve html and images.


I like the minimalist principles behind of hosting of a static website: 

- no waste of resources;
- it serves only one function;
- version control of content with Git;
- minimum security risk;

This personal blog is powered by [Hugo](https://gohugo.io/). Hugo is popular open-source 
static site generator written in [Go](https://golang.org). It provides flexibility and speed
to build wide variation of static websites: blogs, project documentation websites, wiki, 
landing pages etc.

In this post, I describe initial steps to set up and host static blog in GitHub Pages.

## Installation

The installation of Hugo is very simple.
See [Installation guide](https://gohugo.io/getting-started/installing/) for more details.

For MacOS:
~~~shell
brew install hugo
~~~
For Ubuntu:
~~~shell
sudo apt install hugo
~~~

Be aware, the official Ubuntu repository can host older version of Hugo. 
Use [GitHub Release page](https://github.com/gohugoio/hugo/releases) responsibly.

## Create a GitHub repository

Create a new public repository named **username.github.io**, where username is your username 
(or organization name) on GitHub.


Clone the new repository:
~~~shell
git clone https://github.com/username/username.github.io
~~~

## Create a new site

The below command creates empty Hugo site in a folder `username.github.io`.
~~~shell
hugo new site username.github.io
cd username.github.io
~~~

I use the simplest one approach to host site on GitHub Pages which uses `docs` folder in master
branch to publish the content.
~~~shell
echo 'publishDir = "docs"' >> config.toml
~~~

## Add a theme

Hugo has a bunch of good responsive themes. Take a look into [themes.gohugo.io](https://themes.gohugo.io/)
and select a theme what you like. I decided to start with very minimalistic theme - 
[XMin](https://themes.gohugo.io/hugo-xmin/).

~~~shell
git submodule add git@github.com:yihui/hugo-xmin.git themes/hugo-xmin
echo 'theme = "hugo-xmin"' >> config.toml
~~~

## Add a content

~~~shell
hugo new post/my-first-post.md
~~~

Edit the content of newly create file `content/post/my-first-post.md`. Also start the Hugo
server with drafts enabled to see your live changes:

~~~shell
hugo server -D
~~~

Navigate to your new site at http://localhost:1313/.


## Publish
