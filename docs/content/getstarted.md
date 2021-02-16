---
title: Get Started
sidebar: true
sidebarlogo: fresh-white
include_footer: false
---

## The Fresh theme for Hugo

**Fresh** is a theme for the [Hugo](https://gohugo.io) static site generator adapted from the gorgeous, [Bulma](https://bulma.io)-based theme of the same name from [CSS Ninja](https://cssninja.io/themes/fresh). You can find a live demo of the original theme [here](https://cssninjastudio.github.io) and a live demo of the Hugo theme [here](https://hugo-fresh.now.sh/).

<img src="https://raw.githubusercontent.com/StefMa/hugo-fresh/master/images/screenshot.png" style="margin-left:auto;margin-right:auto;" />

## Getting started

To create a new site using this theme

<details open>
<summary>with git submodules</summary>

```bash
# Create site and cd into it
hugo new site my-site && cd my-site

# Clone the Fresh theme
git clone https://github.com/StefMa/hugo-fresh themes/hugo-fresh

# Remove the default config
rm config.toml

# Fetch the example config
curl -O https://raw.githubusercontent.com/StefMa/hugo-fresh/master/exampleSite/config.yaml

# Run the site locally
hugo server

# Open the site in your browser
open http://localhost:1313
```

</details>

<details>
<summary>with hugo modules</summary>

```bash
# Create site and cd into it
hugo new site my-site && cd my-site

# Transform your hugo site to an module
hugo mod init YOUR_MODULE_NAME

# Remove the default config
rm config.toml

# Fetch the example config
curl -O https://raw.githubusercontent.com/StefMa/hugo-fresh/master/exampleSite/config.yaml

# Replace theme with module in config.yaml
#theme: [hugo-fresh]
module:
  imports:
    path: github.com/StefMa/hugo-fresh

# Run the site locally
hugo server

# Open the site in your browser
open http://localhost:1313
```

</details>

## Customizing your page

Checkout the [Landing page docs](../landingpage) to customize the landing page.

There is also the option to create single pages. Check the [Single page docs](../singlepage) for more.

Have some troubles? Check our [troubleshooting](../troubleshooting) guide.
