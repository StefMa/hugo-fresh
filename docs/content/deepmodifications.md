---
title: Deep modification
sidebar: true
sidebarlogo: fresh-white
include_footer: false
---

## Deep modifications

In case you want to make deep modifications of this theme (like changing the colors) you have to 
add the theme as an git submodule rather than as a [hugo module](../module).

To create a new site using this theme as hugo module:
```bash
# Create site and cd into it
hugo new site my-site && cd my-site

# Make a git project out of it
git init

# Add this theme as a git submodule
git submodule add https://github.com/StefMa/hugo-fresh.git themes/hugo-fresh

# Add the dependency to the css files as a git submodule and checkout version 0.9.4
git submodule add https://github.com/jgthms/bulma.git themes/bulma
cd themes/bulma && git checkout 0.9.4

# Go back from themes/bulma dir
cd ../..

# Remove the default config
rm config.toml

# Fetch the example config
curl -O https://raw.githubusercontent.com/StefMa/hugo-fresh/master/exampleSite/hugo.yaml

# Configure the theme as git submodule
# Remove the 'module' section in the `hugo.yml` and add
# theme: 'hugo-fresh' (See also https://github.com/StefMa/hugo-fresh/issues/175#issuecomment-1863358700)

# Change the path of the bulma css files
# Replace `github.com/jgthms/bulma` with `bulma` in
# my-site/themes/hugo-fresh/config.yml

# Run the site locally
hugo server

# Open the site in your browser
open http://localhost:1313
```

Now you're able to change anything in the theme to your needs.

To change the colors for example, open
`my-site/themes/hugo-fresh/assets/fresh/partials/_colors.scss`
and customizes to your needs.

```diff
- $primary: #4FC1E;
- $secondary: #F39200;
+ $primary: #b85ca2;
+ $secondary: #2ee62e;
```

