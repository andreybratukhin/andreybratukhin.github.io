---
title: 'Hugo: a static site generator'
date: '2017-01-03'
tags: ['web']
categories: ['Web']
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

![Hugo](/img/hugo-logo.png)

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
cd username.github.io
git checkout -b gh-pages
echo 'public' >> .gitignore
~~~
gh-pages branch is used to store source of pages. master branch will be used to host published content.

Prepare master branch to host published site:
~~~shell
git checkout --orphan master
git reset --hard
git commit --allow-empty -m "Initializing master branch"
git push origin master
git checkout gh-pages
git worktree add -B master public origin/master
~~~

Hugo generates published content in *public* folder. Above commands map *public* folder to master
branch. Everything in *public* folder goes directly to master branch.

## Create a new site

The below command creates empty Hugo site in a folder `username.github.io`.
~~~shell
cd ..
hugo new site username.github.io
cd username.github.io
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

Save source of posts in gh-pages branch:
~~~shell
git add --all && git commit -m "Save sources" && git push
~~~

Publish generated content to website:
~~~shell
hugo
cd public && git add --all && git commit -m "Publish content" && git push && cd ..

~~~

You can wrap publish commands in handy shell script.

## Workflow

The publishing workflow looks like this:

- Start Hugo server with drafts in separated terminal: `hugo server -D`
- Open in webbrowser: `http://localhost:1313`
- Create new post: `hugo new post/my-next-awesome-post.md`
- Edit file: `content/post/my-next-awesome-post.md`
- When the post is ready remove `draft = true` in meta
- Generate published content: `hugo`
- Publish content by commiting `public` folder to master branch
