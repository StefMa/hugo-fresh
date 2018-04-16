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

## Developing this theme

Feel free to make changes to this theme if you'd like. Pull requests welcome! To get started developing the theme:

```bash
$ make setup
```

## Theme components

The CSS and JavaScript for theme is built using [GulpJS](https://gulpjs.com). Sass assets are in [`source/scss`](source/scss) and JavaScript assets are in [`source/js`](source/js). To develop the static assets:

```bash
$ make dev
```
