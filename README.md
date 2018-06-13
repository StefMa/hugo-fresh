# The Fresh Theme for Hugo

This [Hugo theme](https://themes.gohugo.io/) enables you to easily get up and running with the gorgeous [Fresh](https://cssninja.io/themes/fresh) landing page starter from the wizards at [CSS Ninja](https://cssninja.io/).

![Hugo Fresh theme screenshot](https://raw.githubusercontent.com/lucperkins/hugo-fresh/master/images/screenshot.png)

## Theme variables

The Hugo Fresh theme is quite customizable. The table below lists variables that you can set in your Hugo site's configuration. You can see a full example configuration in [`exampleSite/config.yaml`](exampleSite/config.yaml) (sorry but I just don't like TOML and don't see the point of it).

Variable | What it represents | Default
:--------|:-------------------|:-------
`hero.tagline` | The main tagline in the main hero | Hugo Fresh theme
`hero.subTagline` | The sub-tagline directly below the main tagline | An adaptation of the gorgeous Fresh landing page starter from CSS Ninja
`hero.buttonText` | What the main button in the hero says | Click here

Okay, maybe I don't want to make the full table. You can easily figure it out for yourself using the [example config](exampleSite/config.yaml).

## Building a landing page using this theme

In order to build a landing page using this theme:

```bash
$ hugo new site fresh-landing-page && cd fresh-landing-page
$ git clone https://github.com/lucperkins/hugo-fresh themes/hugo-fresh
$ rm config.toml
$ curl -O https://raw.githubusercontent.com/lucperkins/hugo-fresh/master/exampleSite/config.yaml
$ mkdir content && touch content/.gitkeep
$ hugo
```

Adjust the values in `config.yaml` and the images in `static/img` to personalize your landing page.

## Running this theme locally

The CSS and JavaScript for theme is built using [GulpJS](https://gulpjs.com). Sass assets are in [`source/scss`](source/scss) and JavaScript assets are in [`source/js`](source/js). In order to run this theme locally, you'll need to have Node.js installed (to build the JavaScript and CSS) as well as [Yarn](https://yarnpkg.com/en/). Once Node.js and Yarn are installed, follow these instructions to run the theme locally:

```bash
$ hugo new site fresh-landing-page && cd fresh-landing-page
$ git clone https://github.com/lucperkins/hugo-fresh themes/hugo-fresh
$ rm config.toml
$ curl -O https://raw.githubusercontent.com/lucperkins/hugo-fresh/master/exampleSite/config.yaml
$ mkdir content && touch content/.gitkeep
$ (cd themes/hugo-fresh && make setup && make dev)
# In a different terminal window
$ hugo server
```

Then open up `localhost:1313` in your browser and you should be ready to go!
